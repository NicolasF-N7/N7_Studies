import java.awt.Color;

import afficheur.Afficheur;


public class AfficheurTexte implements Afficheur {


	@Override
	public void dessinerCercle(double x, double y, double rayon, Color c) {
		System.out.print("Cercle {\n" + "    centre_x = " + x + "\n    centre_y = " + y + "\n    rayon = " + rayon + "\n    couleur = " + c + "\n}\n");
	}


	@Override
	public void dessinerLigne(double x1, double y1, double x2, double y2, Color c) {
		System.out.print("Ligne {\n" + "    x1 = " + x1 + "\n    y1 = " + y1 + "\n    x2 = " + x2 + "\n    y2 = " + y2 +"\n    couleur = " + c + "\n}\n");

	}


	@Override
	public void dessinerPoint(double x, double y, Color c) {
		System.out.print("Cercle {\n" + "    x = " + x + "\n    y = " + y + "\n    couleur = " + c + "\n}\n");

	}


	@Override
	public void dessinerTexte(double x, double y, String texte, Color c) {
		System.out.print("Texte {\n" + "    x = " + x + "\n    y = " + y + "\n    valeur = " + '\"' + texte + '\"' + "\n    couleur = " + c + "\n}\n");
	}

}
