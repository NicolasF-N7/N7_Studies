import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import org.junit.Test;
import java.awt.Color;

public class CercleTest{
	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;
	
	private static void assertEqualsPoints(String s, Point a, Point b) {
		assertEquals(s, a.getX(), b.getX(), EPSILON);
		assertEquals(s, a.getY(), b.getY(), EPSILON);
	}
	
	//public static void main(String[] args) {
	@Test
	public void testCercle() {
		Point A = new Point(1, -2);
		Point B = new Point(2, 1);
		Point C = new Point(-4, 0);
		Point E = new Point(-8, -4);
		Point AE = new Point(-7.0/2, -3);
		Point Cc3 = new Point((AE.getX()+B.getX())/2, (AE.getY()+B.getY())/2);
		
		// Construire les cercles
		Cercle C1 = new Cercle(A, E);
		Cercle C2 = Cercle.creerCercle(B, C);
		Cercle C3 = new Cercle(AE, B, Color.green);
		
		//Test getCentre
		assertEqualsPoints("test constructeur points diametralement opposés", C1.getCentre(), AE);
		assertEqualsPoints("test creerCercle", C2.getCentre(), B);
		assertEqualsPoints("test cercle(P,P,Clr)", C3.getCentre(), Cc3);
		
		//Test couleur
		assertEquals(C1.getCouleur(), Color.blue);
		assertEquals(C2.getCouleur(), Color.blue);
		assertEquals(C3.getCouleur(), Color.green);
		
		//Test getRayon
		assertEquals(C1.getRayon(), Math.sqrt(85) /2, EPSILON);
		assertEquals(C2.getRayon(), Math.sqrt(37), EPSILON);
		
		//Test getDiametre
		assertEquals(C1.getDiametre(), Math.sqrt(85), EPSILON);
		assertEquals(C2.getDiametre(), 2*Math.sqrt(37), EPSILON);
		
		/*//Test translater
		Point centreC1 = C1.getCentre();
		centreC1.translater(-5, 5);
		C1.translater(-5, 5);
		assertEqualsPoints("Translater incorrecte", C1.getCentre(), centreC1);
		
		C2.translater(-1, 1);
		B.translater(-1, 1);
		assertEqualsPoints("Translater incorrecte", C2.getCentre(), B);
		
		//Test setRayon
		C1.setRayon(5);
		assertEquals(C1.getRayon(), 5, EPSILON);
		C2.setRayon(7);
		assertEquals(C2.getRayon(), 7, EPSILON);
		
		//Test setDiametre
		C1.setDiametre(3);
		assertEquals(C1.getDiametre(), 3, EPSILON);
		C2.setDiametre(1);
		assertEquals(C2.getDiametre(), 1, EPSILON);*/
		
		//Test perimetre
		//assertEquals(C1.perimetre(), 2*Cercle.PI*C1.getRayon(), EPSILON);
		//assertEquals(C2.perimetre(), 2*Cercle.PI*C2.getRayon(), EPSILON);
		
		//Test aire
		//assertEquals(C1.aire(), Cercle.PI*C1.getRayon()*C1.getRayon(), EPSILON);
		//assertEquals(C2.aire(), Cercle.PI*C2.getRayon()*C2.getRayon(), EPSILON);
		
		/*// Test modification couleur
		Color clr= Color.cyan;
		C2.setCouleur(clr);
		Color clrTmp=C2.getCouleur();
		clr = Color.red;
		assertEquals("Modif couleur E18", C2.getCouleur(), clrTmp);
		
		// Test modification couleur
		Point centreC1= C1.getCentre();
		A.translater(-4, 6);
		assertEqualsPoints("Modif point E18", centreC1, C1.getCentre());
		
		// E1
		C1.translater(-4, 6);// C1 a pour centre (-3,4)
		assertEqualsPoints("Translater cercle E1", A, C1.getCentre());
		
		//E5*/
		
		
	}
}