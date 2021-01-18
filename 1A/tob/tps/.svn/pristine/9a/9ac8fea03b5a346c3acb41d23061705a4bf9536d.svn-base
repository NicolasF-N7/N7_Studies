package allumettes;

public class StrategieRapide implements Strategie {

	/**
	 * Construire une strategie rapide
	 */
	public StrategieRapide() {
		
	}

	/**
	 * Obtenir le nombre d'allumettes à retirer selon la strategie rapide, c'est à dire la prise max (3) ou bien le nombre d'allumettes restantes
	 */
	@Override
	public int nbAllumettesARetirer(Jeu jeu) {
		return Math.min(Jeu.PRISE_MAX, jeu.getNombreAllumettes());
	}

}
