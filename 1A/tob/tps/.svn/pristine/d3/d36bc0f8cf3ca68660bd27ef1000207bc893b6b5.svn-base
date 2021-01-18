package allumettes;

public class Plateau implements Jeu {
	private int nbAllumettesRestantes;

	/**
	 * Contruit un nouveau plateau de jeu
	 */
	public Plateau() {
		nbAllumettesRestantes = this.NB_ALLUMETTES_INITIAL;
	}

	@Override
	public int getNombreAllumettes() {
		return this.nbAllumettesRestantes;
	}

	@Override
	public void retirer(int nbPrises) throws CoupInvalideException {
		if(nbPrises < 1) {
			throw new CoupInvalideException(nbPrises, "< 1");
		}
		else if(this.nbAllumettesRestantes < nbPrises) {
			throw new CoupInvalideException(nbPrises, "> " + this.nbAllumettesRestantes);
		}
		else if(nbPrises > this.PRISE_MAX) {
			throw new CoupInvalideException(nbPrises, "> " + this.PRISE_MAX);
		}
		else {
			this.nbAllumettesRestantes -= nbPrises;
		}

	}

}
