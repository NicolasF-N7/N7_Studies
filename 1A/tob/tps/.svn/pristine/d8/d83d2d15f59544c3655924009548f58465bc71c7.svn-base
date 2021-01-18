import java.awt.Color;

import afficheur.AfficheurSVG;
import afficheur.Ecran;

/** Construire le schéma proposé dans le sujet de TP avec des points,
  * et des segments.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.7 $
  */
public class ExempleSchema1 {

	/** Construire le schéma et le manipuler.
	  * Le schéma est affiché.
	  * @param args les arguments de la ligne de commande
	  */
	public static void main(String[] args)
	{
		// Créer les trois segments
		Point p1 = new Point(3, 2);
		Point p2 = new Point(6, 9);
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		Segment s23 = new Segment(p2, p3);
		Segment s31 = new Segment(p3, p1);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new Point(sx / 3, sy / 3);

		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		s12.afficher();		System.out.println();
		s23.afficher();		System.out.println();
		s31.afficher();		System.out.println();
		barycentre.afficher();	System.out.println();
		
		//Affichage graphique
		//Ecran fenetre=new Ecran("titre", 600, 400, 20);
		//AfficheurSVG fenetre=new AfficheurSVG("titre", "Description", 600, 400);
		AfficheurTexte fenetre= new AfficheurTexte();
		
		
		//fenetre.dessinerAxes();
		p1.dessiner(fenetre);
		p2.dessiner(fenetre);
		p3.dessiner(fenetre);
		s12.dessiner(fenetre);
		s23.dessiner(fenetre);
		s31.dessiner(fenetre);
		barycentre.dessiner(fenetre);
		
		//Translater
		double dx=4.0;
		double dy=-3.0;
		p1.translater(dx, dy);
		p1.setCouleur(Color.red);
		p2.translater(dx, dy);
		p2.setCouleur(Color.red);
		p3.translater(dx, dy);
		p3.setCouleur(Color.red);
		
		s12.translater(dx, dy);
		s12.setCouleur(Color.red);
		s23.translater(dx, dy);
		s23.setCouleur(Color.red);
		s31.translater(dx, dy);
		s31.setCouleur(Color.red);
		
		barycentre.translater(dx, dy);
		barycentre.setCouleur(Color.red);
		
		p1.dessiner(fenetre);
		p2.dessiner(fenetre);
		p3.dessiner(fenetre);
		s12.dessiner(fenetre);
		s23.dessiner(fenetre);
		s31.dessiner(fenetre);
		barycentre.dessiner(fenetre);
		
		
		
		//Affichage SVG
		//fenetre.ecrire();
		//fenetre.ecrire("SchémaSVG.xml");
		
		
		//AfficheurTexte
		AfficheurTexte aff= new AfficheurTexte();
		aff.dessinerCercle(2.0, 4.0, 1.0, Color.green);
		
	}

}
