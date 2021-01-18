import java.awt.Color;

public class Cercle implements Mesurable2D {
	/**Centre représente le centre du cercle.
	 */
	private Point centre;

	/**Rayon du cercle.
	 */
	private double rayon;

	/**La constante mathématique pi.
	 */
	public static final double PI = Math.PI;

	/**La couleur du cercle.
	 */
	private Color couleur;

	//-----CONSTRUCTEURS-----
	/**Créer un cercle à partir de son centre et de son rayon.
	 * Precondition: Rayon strictement positif et Centre non null
	 * @param centre le centre du cercle
	 * @param rayon le rayon du cercle
	 */
	public Cercle(Point centre, double rayon) {
		assert rayon > 0;
		assert centre != null;
		couleur = Color.blue;
		this.centre = new Point(centre.getX(), centre.getY()); // Copie de centre
		this.rayon = rayon;
	}

	/**Construire un points à partir de deux points diamétralement opposés.
	 * @requires: x1 et x2 non nulls
	 * @param x1 Un point du cercle
	 * @param x2 Un point du cercle tel que
	 * le segment [x1 x2] passe par le centre du cercle
	 */
	public Cercle(Point x1, Point x2) {
		assert x1 != null;
		assert x2 != null;
		assert x1.distance(x2) != 0;
		this.rayon = x1.distance(x2) / 2;
		this.centre = new Point(
				(x1.getX() + x2.getX()) / 2,
				(x1.getY() + x2.getY()) / 2);
		couleur = Color.blue;
	}

	/**Construire un points à partir de deux points diamétralement opposés.
	 * @requires: x1 et x2 non nulls
	 * @param x1 Un point du cercle
	 * @param x2 Un point du cercle tel que
	 * le segment [x1 x2] passe par le centre du cercle
	 * @param couleur La couleur du cercle
	 */
	public Cercle(Point x1, Point x2, Color couleur) {
		this(x1, x2); // Réutilisation du 2eme constructeur
		assert x1 != null;
		assert x2 != null;
		assert couleur != null;
		assert x1.distance(x2) != 0;
		/*this.rayon = x1.distance(x2)/2;
		this.centre = new Point((x1.getX()+x2.getX())/2,
		(x1.getY()+x2.getY())/2);*/
		this.couleur = couleur;
	}




	//-----GETTERS-----
	/**Obtenir le centre du cercle.
	 * @return Le centre du cercle
	 */
	public Point getCentre() {
	/*On ne renvoie pas centre car c'est un pointeur
	vers un objet centre (une poignée) mais un nouveau point qui a le même
	coordonnées que centre*/
		return new Point(centre.getX(), centre.getY());
	}

	/**Obtenir le rayon d'un cercle.
	 * @return Le rayon du cercle
	 */
	public double getRayon() {
		return rayon;
	}

	/**Obtenir le diamètre d'un cercle.
	 * @return Le diamètre du cercle
	 */
	public double getDiametre() {
		return 2 * rayon;
	}

	/**Obtenir la couleur d'un cercle.
	 * @return la couleur du cercle
	 */
	public Color getCouleur() {
		Color cpy = new Color(couleur.getRGB());
		return cpy;
	}


	//-----SETTERS-----
	/**Modifier la couleur du cercle.
	 * @requires: c non null
	 * @param c la nouvelle couleur du cercle
	 */
	public void setCouleur(Color c) {
		assert c != null;
		couleur = c;
	}

	/**Modifier le rayon du cercle.
	 * @requires: rayon strictement positif
	 * @param rayon le nouveau rayon du cercle
	 */
	public void setRayon(double rayon) {
		assert rayon > 0;
		this.rayon = rayon;
	}

	/**Modifier le diamètre du cercle.
	 * @requires: diamètre strictement positif
	 * @param diametre le nouveau diamètre du cercle
	 */
	public void setDiametre(double diametre) {
		assert diametre > 0;
		this.rayon = diametre / 2;
	}


	//-----AUTRES-----
	/** Translater le cercle suivan les coordonnées x et y.
	 * @param dx déplacement suivant l'axe des X
	 * @param dy déplacement suivant l'axe des Y
	 */
	public void translater(double dx, double dy) {
		centre.translater(dx, dy);
	}

	/**Savoir si un point est dans le cercle.
	 * @requires: p non null
	 * @param p le point dont on veut savoir si il est dans le cercle
	 * @return true si p est dans le cercle, false sinon
	 */
	public boolean contient(Point p) {
		assert p != null;
		return p.distance(centre) <= rayon;
	}

	/**Obtenir le périmetre du cercle.
	 * @return Perimetre de cercle
	 */
	public double perimetre() {
		return 2 * PI * rayon;
	}

	/**Obtenir l'air délimité par le cercle.
	 * @return L'air du cercle
	 */
	public double aire() {
		return PI * rayon * rayon;
	}

	/**Créer un cercle à partir de son centre et d'un point sur le cercle.
	 * @requires: centre et p2 non nulls
	 * @param centre Le centre du cercle
	 * @param p2 Un point appartement au cercle
	 * @return un nouveau cercle tel que centre est son centre et
	 * p2 est sur le cercle
	 */
	public static Cercle creerCercle(Point centre, Point p2) {
		assert centre != null;
		assert p2 != null;
		assert centre.distance(p2) != 0;
		return new Cercle(centre, centre.distance(p2));
	}

	/**Renvoie les paramètres du cercle sous forme de chaine de caractères.
	 * @return Le cercle mis sous forme de string
	 */
	public String toString() {
		return "C" + rayon + "@" + centre.toString();
	}

	/**Afficher le cercle sur le terminal.
	 */
	public void afficher() {
		System.out.print(this.toString());
	}
}
