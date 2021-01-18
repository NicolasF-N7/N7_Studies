import java.util.ArrayList;
import java.util.List;

public class GroupeAgenda extends AgendaAbstrait{

	//Liste de AgendaAbstrait ?
	private List<Agenda> groupe;// Possible ? instanciation sur classe abstraite ?
	
	public GroupeAgenda(String nomGroupe) {
		super(nomGroupe);
		groupe = new ArrayList<Agenda>();
	}
	
	public void ajouter(Agenda a) {
		groupe.add(a);
	}

	@Override
	public void enregistrer(int creneau, String rdv)
			throws CreneauInvalideException, IllegalArgumentException, OccupeException {
		super.verifierCreneauValide(creneau);
		//On cherche si le creneau est libre pour tout les agenda du groupe
		boolean tousLibreGroupe = false;
		try {
			this.getRendezVous(creneau);
		}catch(LibreException e) {
			tousLibreGroupe = true;
		}
		
		if(!tousLibreGroupe) {
			throw new OccupeException("Un des agenda du groupe n'est pas libre pour ce creneau");
		}
		else {// Si tous libre: on ajoute l'evenement aux agendas du groupe
			for(Agenda a: groupe) {
				a.enregistrer(creneau, rdv);
			}
		}
		
		
		
	}

	@Override
	public boolean annuler(int creneau) throws CreneauInvalideException {
		super.verifierCreneauValide(creneau);

		boolean agendaGroupeModif = false;
		for(Agenda a: groupe) {
			agendaGroupeModif = agendaGroupeModif || a.annuler(creneau);//CreneauInvalideException non verifié donc ok si on la catch pas et si on la throws pas
		}
		
		
		return agendaGroupeModif;
	}

	@Override
	public String getRendezVous(int creneau) throws CreneauInvalideException, LibreException {
		super.verifierCreneauValide(creneau);
		
		boolean tousLibreGroupe = true;
		boolean existeCreneauVide = false;// à la fin du parcourt :vaut true si il existe un rdv vide, false sinon
		
		
		//MARCHE PAS SI 1ER CRENEAU EXISTE 
		String rdvActuel = null;// le rdv actuel pdt le parcourt
		String rdvTemp = "";
		for(Agenda a: groupe) {
			// initialiser à rdvActuel au cas ou le try Throw LibreException
			try {
				rdvTemp = a.getRendezVous(creneau);
				tousLibreGroupe = false;//si on arrive ici c'est qu'il y a un agenda de la liste qui est occupé pour ce creneau
			}
			catch(LibreException e) {
				existeCreneauVide = true;
			}
			
			if(rdvActuel != null && rdvTemp != rdvActuel) {// au moins deja 1 tour de boucle 
				return null;
			}
			rdvActuel = rdvTemp;
		}
		
		
		if(tousLibreGroupe) {
			throw new LibreException("Ce créneau est libre pour tout les agenda du groupe");
		}else if(existeCreneauVide) {//le cas deux rdv differents a deja été traité
			return null;//si existe creneau vide et non tous vide alors deux differents -> renvoie null
		}
		else {
			return rdvActuel;
		}
	}

}
