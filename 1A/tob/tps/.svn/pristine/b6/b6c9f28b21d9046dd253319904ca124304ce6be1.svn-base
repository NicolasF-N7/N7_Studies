package allumettes;

public class Joueur {
	
	String nom;
	Strategie strat;

	/**
	 * Construire un joueur à partir de son nom, et d'une stratégie
	 * @param nom Le nom du joueur
	 * @param strat La stratégie suivie par le joueur au cours de la partie
	 */
	public Joueur(String nom, Strategie strat) {
		this.nom = nom;
		this.strat = strat;
	}
	
	/**
	 * Obtenir le nom du joueur
	 * @return le nom du joueur
	 */
	public String getNom() {
		return this.nom;
	}
	
	/**
	 * Modifier la stratégie du joueur en cours de jeu
	 * @param La nouvelle stratégie que le joueur suivra
	 */
	public void setStrategie(Strategie strat) {
		this.strat = strat;
	}
	/**
	 * Demande au joueur le nombre d'allumettes qu'il veut prendre (depend de sa strategie)
	 * @param le jeu courant
	 * @return Le nombre d'allumettes choisis
	 */
	public int getPrise(Jeu jeu) {
		return strat.nbAllumettesARetirer(jeu);
	}

}
