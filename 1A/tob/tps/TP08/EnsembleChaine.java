/**
 * 
 */

/**
 * @author nfoin
 *
 */
public class EnsembleChaine implements Ensemble {

	private Cellule cell;
	
	/**Initialise un ensemble vide
	 * 
	 */
	public EnsembleChaine() {
		cell = null;
	}
	
	public EnsembleChaine(Cellule c) {
		cell = c;
	}
	
	/**
	 * @return La taille de l'ensemble
	 */
	@Override
	public int cardinal() {
		int count = 0;
		Cellule curseur = cell;
		while (curseur != null){
			count++;
			curseur = curseur.getSuivante();
		}
				
		return count;
	}

	/**
	 * @return true si l'ensemble est vide, false sinon
	 */
	@Override
	public boolean estVide() {
		return (cell == null);
	}

	/**
	 * @return true si x est dans l'ensemble, false sinon
	 */
	@Override
	public boolean contient(int x) {
		boolean estPresent=false;
		Cellule curseur = cell;
		System.out.print("[");
		while (curseur != null){			
			System.out.print(curseur.getElement());
			estPresent = (curseur.getElement() == x);
			curseur = curseur.getSuivante();
		}
		System.out.print("]");
		return estPresent;
	}

	/**
	 * Ajout de x en tete de l'EnsembleChaine
	 */
	@Override
	public void ajouter(int x) {
		/*Cellule tmp = new Cellule(x, cell);
		cell = tmp;*/
		cell = new Cellule(x, cell);
		/*Ou bien
		Cellule tmp = new Cellule(x);
		tmp.getSuivante() = cell;
		cell = tmp;*/
		
	}

	/**
	 * NOT WORKING
	 */
	@Override
	public void supprimer(int x) {
		// car où card = 0 ou 1
		if(cell == null)
			return;
		if(cell.getElement() == x) {
			if(cell.getSuivante() == null)
				cell=null;
			else
				cell.setSuivante(cell.getSuivante().getSuivante());
			return;
		}
		
		Cellule curseur = cell;
		while (curseur.getSuivante() != null){
			if(curseur.getSuivante().getElement() == x) {
				curseur.setSuivante(curseur.getSuivante().getSuivante());
				return;
			}
			curseur = curseur.getSuivante();
		}
		return;
	}

}
