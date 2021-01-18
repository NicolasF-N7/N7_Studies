import java.awt.Color;

/**
 * @author nfoin
 *
 */
public abstract class FigureGeometrique {

	private Color couleur;
	/**  Construire une figure géométrique à partir de sa couleur.
	 *  @param clr la couleur
	 */
	public FigureGeometrique(Color clr) {
		this.couleur = clr;
	}
	
	/** Obtenir la couleur du segment.
	 * @return la couleur du segment
	 */
	public Color getCouleur() {
		return this.couleur;
	}
	
	/** Changer la couleur du segment.
	 * @param nouvelleCouleur nouvelle couleur
	 */
	public void setCouleur(Color nouvelleCouleur) {
		this.couleur = nouvelleCouleur;
	}
	
	/** Translater la figure.
	* @param dx déplacement suivant l'axe des X
	* @param dy déplacement suivant l'axe des Y
	*/
	public abstract void translater(double dx, double dy);
	
	/** Dessiner la figure sur l'afficheur.
	 * @param afficheur l'afficheur à utiliser
	 */
	public abstract void dessiner(afficheur.Afficheur afficheur);
	
	/** Afficher la figure:
	 */
	public abstract void afficher();

}
