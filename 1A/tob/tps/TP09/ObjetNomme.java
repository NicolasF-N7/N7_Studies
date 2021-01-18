/**
 * Un objet nommé est un objet qui a un nom.
 */
public abstract class ObjetNomme {

	private String nom;//non déclaré dans l'interface car private

	/**
	 * Initialiser le nom de l'agenda.
	 *
	 * @param nom le nom de l'agenda
	 * @throws IllegalArgumentException si nom n'a pas au moins un caractère
	 */
	public ObjetNomme(String nom) throws IllegalArgumentException {
		if(nom == null || nom == "") {
			throw new IllegalArgumentException("Le nom de l'agenda doit contenir au moins un caractère");
		}
		this.nom = nom;
	}


	/**
	 * Obtenir le nom de cet objet.
	 * @return le nom de cet objet
	 */
	public String getNom() {
		return this.nom;
	}


}
