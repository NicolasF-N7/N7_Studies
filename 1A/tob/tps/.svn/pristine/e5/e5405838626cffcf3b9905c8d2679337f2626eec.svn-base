package allumettes;

public class PlateauProcuration implements Jeu {
	private Plateau plateauReel;

	/**
	 * Créer une nouvelle procuration de plateau
	 */
	public PlateauProcuration() {
		this.plateauReel = new Plateau();
	}
	
	/**
	 * Créer une procuration de plateau à partire d'un plateau existant
	 * @param p Le plateau existant
	 */
	public PlateauProcuration(Plateau p) {
		this.plateauReel = p;
	}

	@Override
	public int getNombreAllumettes() {
		return this.plateauReel.getNombreAllumettes();
	}

	/**
	 * Operation interdite sur la procuration: throw OperationInterdite
	 */
	@Override
	public void retirer(int nbPrises) throws CoupInvalideException, OperationInterditeException {
		// Si appelé par le joueur, alors lever exception OPERATIONINTERDITEEXCEPTION WTF
		throw new OperationInterditeException("Operation retirer() interdite par un joueur.");

	}

}
