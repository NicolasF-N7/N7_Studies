/**
 * Définition d'un agenda individuel.
 */
public class AgendaIndividuel extends AgendaAbstrait {

	private String[] rendezVous;	// le texte des rendezVous


	/**
	 * Créer un agenda vide (avec aucun rendez-vous).
	 *
	 * @param nom le nom de l'agenda
	 * @throws IllegalArgumentException si nom nul ou vide
	 */
	public AgendaIndividuel(String nom) throws IllegalArgumentException{
		super(nom);//throw IllegalArgumentException
		this.rendezVous = new String[Agenda.CRENEAU_MAX + 1];
			// On gaspille une case (la première qui ne sera jamais utilisée)
			// mais on évite de nombreux « creneau - 1 »
	}


	@Override
	public void enregistrer(int creneau, String rdv) throws CreneauInvalideException, IllegalArgumentException, OccupeException{
		super.verifierCreneauValide(creneau);//throw CreneauInvalideException
		if(rdv == null || rdv == "") {
			throw new IllegalArgumentException("Le nom du rendez-vous doit contenir au moins un caractère");
		}
		if(this.rendezVous[creneau] != null) {
			throw new OccupeException("Creneau déjà occupé par: " + this.rendezVous[creneau] + ".");
		}
		this.rendezVous[creneau] = rdv;
	}


	@Override
	public boolean annuler(int creneau) throws CreneauInvalideException{
		super.verifierCreneauValide(creneau);//throw CreneauInvalideException
		boolean modifie = (this.rendezVous[creneau] != null);
		this.rendezVous[creneau] = null;
		return modifie;
	}


	@Override
	public String getRendezVous(int creneau) throws CreneauInvalideException, LibreException{
		super.verifierCreneauValide(creneau);//throw CreneauInvalideException
		if(this.rendezVous[creneau] == null) {
			throw new LibreException("Creneau vide.");
		}
		return this.rendezVous[creneau];
	}


}
