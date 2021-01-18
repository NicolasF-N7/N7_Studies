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
		int nombreAllumettesRestantes = jeu.getNombreAllumettes();
		//Demande du Nb d'allumettes à prendre tant que le nombre n'est pas valide
			
		System.out.print("Combien prenez-vous d'allumettes ? ");
		
		//Try pour ne pas crasher si l'utilisateur rentre un caractère
		try {
			choixUtilisateur = scanner.nextInt(); //Scan
			scanner.nextLine(); //Vider le buffer
		}
		catch (InputMismatchException e) {
			System.out.println("Vous devez donner un entier.");
			scanner.nextLine();
			return nbAllumettesARetirer(jeu);
		}
		return choixUtilisateur;
	}

}
