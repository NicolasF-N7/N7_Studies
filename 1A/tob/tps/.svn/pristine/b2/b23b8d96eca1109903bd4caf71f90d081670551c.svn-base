package allumettes;

public class Test {

	public static void main(String[] args) {
		System.out.println("------Test 1-------");
		String[] arguments = {"-confiant", "j1@inexistante", "j2@expert"};
		Partie.main(arguments);
		//Affichage "strategie non definie" OK
		
		System.out.println("------Test 2-------");
		arguments[0] = "-confiant";
		arguments[1] = "j1@naif";
		arguments[2] = "j2@expert";
		Partie.main(arguments);
		//j2 a gagné : OK
		
		System.out.println("------Test 3-------");
		arguments[0] = "-confiant";
		arguments[1] = "j1@naif";
		arguments[2] = "j2@naif";
		Partie.main(arguments);
		//Ok
		
		System.out.println("------Test 4-------");
		arguments[0] = "-confiant";
		arguments[1] = "j1@rapide";
		arguments[2] = "j2@tricheur";
		Partie.main(arguments);
		//Ok car partie continué et tricheur a gagné
		
		System.out.println("------Test 5-------");
		arguments[0] = "j1@rapide";
		arguments[1] = "j2@tricheur";
		Partie.main(arguments);
		//Ok car tricheur devoilé
	}

}
