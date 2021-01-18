/**
 * Classe de test pour EnsembleChaine.
 */
public class EnsembleChaineTest extends EnsembleTestAbstrait {

	protected Ensemble nouvelEnsemble(int capacite) {
		return new EnsembleChaine();
	}
	
	public static void main(String args[]) {
		Ensemble ens = new EnsembleChaine();
		
		ens.ajouter(2);
		ens.ajouter(3);
		ens.ajouter(5);
		ens.ajouter(7);
		System.out.print(ens.cardinal());
		System.out.print(ens.contient(5));
		ens.supprimer(5);
		ens.supprimer(7);
		System.out.print(ens.contient(1));
		System.out.print(ens.cardinal());
	}

}
