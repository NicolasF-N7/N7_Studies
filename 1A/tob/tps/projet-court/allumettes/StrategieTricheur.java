package allumettes;

public class StrategieTricheur implements Strategie {

	public StrategieTricheur() {
	}

	@Override
	public int nbAllumettesARetirer(Jeu jeu) {
		try {
			//On retire toutes les allumettes présentes sauf 2
			for (int i = jeu.getNombreAllumettes(); i > Jeu.PRISE_MAX-1; i -= Jeu.PRISE_MAX) {
				int nbAllumettesARetirer = Math.min(Jeu.PRISE_MAX, jeu.getNombreAllumettes()-(Jeu.PRISE_MAX-1));
				jeu.retirer(nbAllumettesARetirer);
			}
		} catch (CoupInvalideException e) {
			System.out.println("CoupInvalideException soulevée par StrategieTricheur::nbAllumettesARetirer: " + e.getMessage());
		}
		//On est sur de gagner puisque l'autre joueur se retrouve avec la dernière allumette
		return 1;
	}

}
