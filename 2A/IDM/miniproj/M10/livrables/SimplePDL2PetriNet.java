package simplepdl.manip;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import simplepdl.Process;
import simplepdl.SimplepdlFactory;
import simplepdl.SimplepdlPackage;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.WorkSequenceType;

import petrinet.Arc;
import petrinet.Transition;
import petrinet.Place;
import petrinet.PetriNet;
import petrinet.PetriNetElement;
import petrinet.PetrinetFactory;
import petrinet.PetrinetPackage;

public class SimplePDL2PetriNet {

	public static void main(String[] args) {
		// Chargement du package SimplePDL afin de l'enregistrer dans le registre d'Eclipse.
		SimplepdlPackage packageInstance = SimplepdlPackage.eINSTANCE;
		PetrinetPackage petriPackageInstance = PetrinetPackage.eINSTANCE;
		
		// Enregistrer l'extension ".xmi" comme devant Ãªtre ouverte Ã 
		// l'aide d'un objet "XMIResourceFactoryImpl"
		Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
		Map<String, Object> m = reg.getExtensionToFactoryMap();
		m.put("xmi", new XMIResourceFactoryImpl());
		
		// CrÃ©er un objet resourceSetImpl qui contiendra une ressource EMF (notre modèle et le réseau de pétri)
		ResourceSet resSet = new ResourceSetImpl();
		
		
		/** Charger le modele simplePDL **/
		String processName = "ProcExmpl";
		URI modelURI = URI.createURI("models/" + processName + ".xmi");
		Resource model = resSet.getResource(modelURI, true);// Le model dont on veut le réseau de petri
		
		/** Créer le réseau de pétri **/
		URI petriNetURI = URI.createURI("models/PetriNetOf_" + processName + ".xmi");
		Resource petriRsc = resSet.createResource(petriNetURI);
		
		// La fabrique pour fabriquer les éléments de PetriNet
		PetrinetFactory petriFactory = PetrinetFactory.eINSTANCE;
		
		// Récupérer le premier élément du modele simplepdl
		Process process = (Process) model.getContents().get(0);
		
		/** CREATION DU RESEAU DE PETRI **/
		PetriNet pn = (PetriNet) petriFactory.createPetriNet();
		pn.setName(process.getName());
		petriRsc.getContents().add(pn);
		
		// On traduit d'abord les WD
		for (Object o : process.getProcessElements()) {
			if (o instanceof WorkDefinition) {
				WorkDefinition wd = (WorkDefinition) o;
				String wdName = wd.getName();
				
				//Creation place Ready started, running, finished
				Place plReady = petriFactory.createPlace();
				plReady.setName(wdName + "_Ready");
				plReady.setNbJetons(1);
				Place plStarted = petriFactory.createPlace();
				plStarted.setName(wdName + "_Started");
				plStarted.setNbJetons(0);
				Place plRunning = petriFactory.createPlace();
				plRunning.setName(wdName + "_Running");
				plRunning.setNbJetons(0);
				Place plFinished = petriFactory.createPlace();
				plFinished.setName(wdName + "_Finished");
				plFinished.setNbJetons(0);
				
				//Creation transitions start et finish
				Transition trStart = petriFactory.createTransition();
				trStart.setName(wdName + "_Start");
				Transition trFinish = petriFactory.createTransition();
				trFinish.setName(wdName + "_Finish");
				
				//Creation des arcs
				Arc arcRdy2St = petriFactory.createArc();
				arcRdy2St.setPredecessor(plReady);
				arcRdy2St.setSuccessor(trStart);
				arcRdy2St.setPoids(1);
				Arc arcSt2Sd = petriFactory.createArc();
				arcSt2Sd.setPredecessor(trStart);
				arcSt2Sd.setSuccessor(plStarted);
				arcSt2Sd.setPoids(1);
				Arc arcSt2Run = petriFactory.createArc();
				arcSt2Run.setPredecessor(trStart);
				arcSt2Run.setSuccessor(plRunning);
				arcSt2Run.setPoids(1);
				Arc arcRun2Fsh = petriFactory.createArc();
				arcRun2Fsh.setPredecessor(plRunning);
				arcRun2Fsh.setSuccessor(trFinish);
				arcRun2Fsh.setPoids(1);
				Arc arcFsh2Fd = petriFactory.createArc();
				arcFsh2Fd.setPredecessor(trFinish);
				arcFsh2Fd.setSuccessor(plFinished);
				arcFsh2Fd.setPoids(1);
				
				//Ajout
				pn.getPetriNetElements().add(plReady);
				pn.getPetriNetElements().add(plStarted);
				pn.getPetriNetElements().add(plRunning);
				pn.getPetriNetElements().add(plFinished);
				pn.getPetriNetElements().add(trStart);
				pn.getPetriNetElements().add(trFinish);
				pn.getPetriNetElements().add(arcRdy2St);
				pn.getPetriNetElements().add(arcSt2Sd);
				pn.getPetriNetElements().add(arcSt2Run);
				pn.getPetriNetElements().add(arcRun2Fsh);
				pn.getPetriNetElements().add(arcFsh2Fd);
				
				System.out.println("Wd " + wdName + " translated");
			}
		}
		
		//Puis on traduit les WS (par des transitions entre acti)
		for (Object o : process.getProcessElements()) {
			if (o instanceof WorkSequence) {
				WorkSequence ws = (WorkSequence) o;
				WorkDefinition wdPred= ws.getPredecessor();
				WorkDefinition wdSucc= ws.getSuccessor();
				
				Arc readArc = petriFactory.createArc();
				readArc.setPoids(0);
				
				if(ws.getLinkType() == WorkSequenceType.START_TO_START || ws.getLinkType() == WorkSequenceType.START_TO_FINISH) {
					//Recherche de la place Started de l'activité predecesseur
					for(PetriNetElement pne : pn.getPetriNetElements()) {
						if(pne instanceof Place && ((Place) pne).getName().equals(wdPred.getName() + "_Started")) {
							Place startedPlFromPredecessorActi;
							startedPlFromPredecessorActi = (Place) pne;
							readArc.setPredecessor(startedPlFromPredecessorActi);
						}
					}
				}
				

				if(ws.getLinkType() == WorkSequenceType.FINISH_TO_START || ws.getLinkType() == WorkSequenceType.FINISH_TO_FINISH) {
					//Recherche de la place Finished de l'activité predecesseur
					for(PetriNetElement pne : pn.getPetriNetElements()) {
						if(pne instanceof Place && ((Place) pne).getName().equals(wdPred.getName() + "_Finished")) {
							Place finishedPlFromPredecessorActi;
							finishedPlFromPredecessorActi = (Place) pne;
							readArc.setPredecessor(finishedPlFromPredecessorActi);
						}
					}
				}
				
				if(ws.getLinkType() == WorkSequenceType.START_TO_START || ws.getLinkType() == WorkSequenceType.FINISH_TO_START) {
					//Recherche de la transition Start de l'activité successeur
					for(PetriNetElement pne : pn.getPetriNetElements()) {
						if(pne instanceof Transition && ((Transition) pne).getName().equals(wdSucc.getName() + "_Start")) {
							Transition startedTrFromSuccessorActi;
							startedTrFromSuccessorActi = (Transition) pne;
							readArc.setSuccessor(startedTrFromSuccessorActi);
						}
					}
				}
				
				if(ws.getLinkType() == WorkSequenceType.START_TO_FINISH || ws.getLinkType() == WorkSequenceType.FINISH_TO_FINISH) {
					//Recherche de la place Finished de l'activité successeur
					for(PetriNetElement pne : pn.getPetriNetElements()) {
						if(pne instanceof Transition && ((Transition) pne).getName().equals(wdSucc.getName() + "_Finish")) {
							Transition finishedTrFromSuccessorActi;
							finishedTrFromSuccessorActi = (Transition) pne;
							readArc.setSuccessor(finishedTrFromSuccessorActi);
						}
					}
				}
				pn.getPetriNetElements().add(readArc);
			}
		}
		
	
		System.out.println("Processus : " + process.getName() + " transformé en réseau de petri.");
		
		// Sauver le réseau de petri
	    try {
	    	petriRsc.save(Collections.EMPTY_MAP);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
