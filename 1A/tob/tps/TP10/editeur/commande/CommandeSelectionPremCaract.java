package editeur.commande;

import editeur.Ligne;

public class CommandeSelectionPremCaract extends CommandeLigne {

	public CommandeSelectionPremCaract(Ligne l) {
		super(l);
	}

	@Override
	public void executer() {
		ligne.raz();
	}

	@Override
	public boolean estExecutable() {
		return ligne.getCurseur() > 1;
	}

}
