package allumettes;

public class Arbitre {
	private Joueur j1;
	private Joueur j2;
	private boolean confiant;

	/** Créer un arbitre à partir des 2 joueur qu'il devra arbitrer
	 * 
	 */
	public Arbitre(Joueur j1, Joueur j2) {
		this.j1 = j1;
		this.j2 = j2;
		this.confiant = false; //Par default
	}
	
	/**
	 * Rend l'arbitre confiant ou non. Sachant qu'il ne l'est pas par défaut
	 * @param c
	 */
	public void setConfiant(Boolean c) {
		this.confiant = c;
	}
	
	/**
	 * Faire joueur le joueur jusqu'à ce que la saisie soit cohérente avec le nb d'allumettes restant en jeu et les regles du jeu
	 * @return true si le coup joué est valide, false sinon
	 */
	public Boolean jouer(Joueur joueur, Jeu jeu) throws OperationInterditeException {
		try {
			//Demande de la prise du joueur selon si arbitre confiant
			int choixJoueur;
			if (this.confiant) {
				choixJoueur = joueur.getPrise((Plateau) jeu);
			}
			else {
				choixJoueur = joueur.getPrise(new PlateauProcuration((Plateau) jeu)); //Le joueur ne pourra pas appeler jeu.retirer()
				//choixJoueur = joueur.getPrise(new PlateauProcuration((Plateau) jeu));
			}
			
			System.out.println(joueur.getNom() + " prend " + choixJoueur + (choixJoueur > 1 || choixJoueur < -1 ? " allumettes."
					: " allumette."));
			jeu.retirer(choixJoueur); // throw CoupInvalideException
			
		} catch (CoupInvalideException e) {
			System.out.println(e.getMessage());
			
			//Mauvaise saisie du joueur: on redemande
			System.out.println("Recommencez !");
			return false; // Coup non valide : refaire jouer le même joueur au tour suivant
		}
		return true;
	}
	
	public void arbitrer(Jeu jeu) {
		boolean tourJoueurJ1 = true; // Indique que c'est au tour de J1 de jouer
		
		//Boucle principale du jeu
		try {
			while (jeu.getNombreAllumettes() > 0) {
				System.out.println();
				System.out.println("Nombre d'allumettes restantes : " + jeu.getNombreAllumettes());
				System.out.println("Au tour de " + (tourJoueurJ1 ? j1.getNom() : j2.getNom()) + ".");
			
				//Faire jouer le bon  joueur
				Boolean coupValide;
				if(tourJoueurJ1) {
					coupValide = this.jouer(j1, jeu);
				}
				else {
					coupValide = this.jouer(j2, jeu);
				}
				
				if (coupValide) {
					tourJoueurJ1 = !tourJoueurJ1; // on fait jouer l'autre joueur au tour d'après
				}
			}
		}
		catch (OperationInterditeException e) {
			System.out.println("Partie abandonnée car " + (tourJoueurJ1 ? j1.getNom() : j2.getNom()) + " a triché !");
			return;
		}
		
		System.out.println((!tourJoueurJ1 ? j1.getNom() : j2.getNom()) + " a perdu !");
		System.out.println((tourJoueurJ1 ? j1.getNom() : j2.getNom()) + " a gagné !");
	}

}