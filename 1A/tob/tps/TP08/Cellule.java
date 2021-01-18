
public class Cellule {
	private int element;
	private Cellule suivante;
	
	
	/**
	 * La cellue crée n'a pas de cellule suivante lors de la construction
	 * @param x la valeur de la cellule crée
	 */
	public Cellule(int x) {
		this.element = x;
		suivante = null;
	}
	
	public Cellule(int x, Cellule suivante) {
		this.element = x;
		this.suivante = suivante;
	}
	
	/**
	 * 
	 * @return l'element contenu dans la cellule
	 */
	public int getElement() {
		return element;
	}
	
	/**
	 * 
	 * @return la cellule suivante
	 */
	public Cellule getSuivante() {
		return suivante;
	}
	
	
	/**
	 * Modifie la valeur de la cellule
	 */
	public void setElement(int x) {
		element = x;
	}
	
	/**
	 * 
	 * @param c Modifie la cellule suivante à c
	 */
	public void setSuivante(Cellule c) {
		suivante = c;
	}
}
