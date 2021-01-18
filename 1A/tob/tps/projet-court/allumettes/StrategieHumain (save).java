package allumettes;
import java.util.InputMismatchException;
import java.util.Scanner;

public class StrategieHumain implements Strategie {
	Scanner scanner;
	/**
	 * Creer une strategie jouee par un humain
	 */
	public StrategieHumain() {
		scanner = new Scanner(System.in);
	}

	/**
	 * Demander a l'utilisateur le nombre d'allumettes qu'il veut retirer
	 */
	@Override
	public int nbAllumettesARetirer(Jeu jeu) {
		int choixUtilisateur = 1;
		boolean afficherMessage = false;
		int nombreAllumettesRestantes = jeu.getNombreAllumettes();
		//Demande du Nb d'allumettes à prendre tant que le nombre n'est pas valide
		
		do {
			if (afficherMessage) {
				System.out.println("Veuillez choisir un nombre entre 1 et " + Math.min(3, nombreAllumettesRestantes) + "."); 
			}
			
			System.out.print("Combien prenez-vous d'allumettes ? ");
			
			//Try pour ne pas crasher si l'utilisateur rentre un caractère
			try {
				choixUtilisateur = scanner.nextInt();//Scan
				scanner.nextLine(); //Vider le buffer
			}
			catch (InputMismatchException e) {
				System.out.println("Veuillez rentrer un entier.");
				scanner.nextLine();
				return nbAllumettesARetirer(jeu);
			}			
			
			afficherMessage = true;
		} while (choixUtilisateur < 0 || choixUtilisateur > Jeu.PRISE_MAX || choixUtilisateur > nombreAllumettesRestantes);
		
		return choixUtilisateur;
	}

}
