package allumettes;

/** Lance une partie des 13 allumettes en fonction des arguments fournis
 * sur la ligne de commande.
 * @author	Xavier Crégut
 * @version	$Revision: 1.5 $
 */
public class Partie {
	private static final int NB_JOUEURS = 2;

	/** Lancer une partie. En argument sont donnés les deux joueurs sous
	 * la forme nom@stratégie.
	 * @param args la description des deux joueurs
	 */
	
	public static void main(String[] args) {
		try {
			////////////////////////////////////////interpreterArguments////////////////////////////////////////////
			String[] nomJoueurs = new String[NB_JOUEURS];
			String[] strategieJoueurs = new String[NB_JOUEURS];
			boolean confiant;
			confiant = interpreterArguments(args, nomJoueurs, strategieJoueurs);
			////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			//---------Affichage des arguments:
			//System.out.println("Arbitre confiant: " + confiant);
			//for(int i = 0; i < NB_JOUEURS; i++) {
			//	System.out.println("Joueur no " + i + " : Nom: " + nomJoueurs[i] + ", strategie: " + strategieJoueurs[i]);
			//}
			//--------
			
			//Creation des strategies
			Strategie strategies[] = new Strategie[NB_JOUEURS];
			for (int i = 0; i < NB_JOUEURS; i++) {
				switch (strategieJoueurs[i].toLowerCase()) {
					case "naif": strategies[i] = new StrategieNaive();
						break;
					case "rapide": strategies[i] = new StrategieRapide();
						break;
					case "expert": strategies[i] = new StrategieExpert();
						break;
					case "tricheur": strategies[i] = new StrategieTricheur();
						break;
					case "humain": strategies[i] = new StrategieHumain();
						break;
					default: throw new StrategieInexistanteException(strategieJoueurs[i]);
				}
			}
			
			
			//Creation des joueurs
			Joueur joueurs[] = new Joueur[NB_JOUEURS];
			for (int i = 0; i < NB_JOUEURS; i++) {
				joueurs[i] = new Joueur(nomJoueurs[i], strategies[i]);
			}
			
			//Creation du jeu
			Jeu jeu = new Plateau();
			
			Arbitre arbitre = new Arbitre(joueurs[0], joueurs[1]);
			arbitre.setConfiant(confiant);
			arbitre.arbitrer(jeu);//Lancement de la partie
			

		} //Probleme dans l'interprétation des arguments
		catch (ConfigurationException e) {
			System.out.println("Erreur : " + e.getMessage());
			System.out.println();
			afficherUsage();
		}//Strategie inexistante
		catch (StrategieInexistanteException e) {
			System.out.println("" + e.getMessage());
			System.out.println();
			afficherUsage();
		}
	}
	
	//nomJoueurs et strategieJoueurs doivent etre des tableau de NB_JOUEURS strings
	private static boolean interpreterArguments(String[] args, String[] nomJoueurs, 
			String[] strategieJoueurs) throws ConfigurationException{
		verifierNombreArguments(args);
		
		boolean confiant = false;
		//Recherche de -confiant dans les arguments
		if (args[0].equals("-confiant")) {
			confiant = true;
		}
		else if (args[0].contains("-")) {
			throw new ConfigurationException("Mauvaise synthaxe des arguments. Veuillez utiliser -confiant comme premier argument");
		}
		
		//Recuperation des nom et stratégies des joueurs
		//Ici on sait qu'il y a 2 ou 3 arguments dans args
		int indexOffset = confiant ? 1 : 0; //Décalage de l'index des arguments joueur@strategie
		String tabJoueurs[][] = new String[NB_JOUEURS][2];//contient les nom et strat de chaque joueurs
		
		//Verification de la synthaxe des arguments: respect de joueur@strategie
		if (args[0 + indexOffset].split("@").length != 2 || args[1 + indexOffset].split("@").length != 2) {
			throw new ConfigurationException("Mauvaise synthaxe des arguments. Veuillez respecter NomJoueur@Strategie");
		}
		
		for (int i = 0; i < NB_JOUEURS; i++) {
			tabJoueurs[i] = args[i + indexOffset].split("@");
		}
		
		//Separation des nom des joueur et strategies
		for (int i = 0; i < NB_JOUEURS; i++) {
			nomJoueurs[i] = tabJoueurs[i][0];
			strategieJoueurs[i] = tabJoueurs[i][1];
		}
		return confiant;
	}

	private static void verifierNombreArguments(String[] args) throws ConfigurationException{
		final int nbJoueurs = NB_JOUEURS;
		if (args.length < nbJoueurs) {
			throw new ConfigurationException("Trop peu d'arguments : "
					+ args.length);
		}
		if (args.length > nbJoueurs + 1) {
			throw new ConfigurationException("Trop d'arguments : "
					+ args.length);
		}
	}

	/** Afficher des indications sur la manière d'exécuter cette classe. */
	public static void afficherUsage() {
		System.out.println("\n" + "Usage :"
				+ "\n\t" + "java allumettes.Partie joueur1 joueur2"
				+ "\n\t\t" + "joueur est de la forme nom@stratégie"
				+ "\n\t\t" + "strategie = naif | rapide | expert | humain | tricheur"
				+ "\n"
				+ "\n\t" + "Exemple :"
				+ "\n\t" + "	java allumettes.Partie Xavier@humain "
					   + "Ordinateur@naif"
				+ "\n"
				);
	}

}
