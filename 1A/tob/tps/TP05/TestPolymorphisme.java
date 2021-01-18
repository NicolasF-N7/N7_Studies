/** Tester le polymorphisme (principe de substitution) et la liaison
 * dynamique.
 * @author	Xavier Crégut
 * @version	1.5
 */
public class TestPolymorphisme {

	/** Méthode principale */
	public static void main(String[] args) {
		// Créer et afficher un point p1
		Point p1 = new Point(3, 4);	// Est-ce autorisé ? Pourquoi ?  car liaison statique OK
		p1.translater(10,10);		// Quel est le translater exécuté ? celui de Point
		System.out.print("p1 = "); p1.afficher (); System.out.println ();
										// Qu'est ce qui est affiché ?
		//p1 = (13, 14)

		// Créer et afficher un point nommé pn1
		PointNomme pn1 = new PointNomme (30, 40, "PN1");
										// Est-ce autorisé ? Pourquoi ? idem
		pn1.translater (10,10);		// Quel est le translater exécuté ? celui de Point car PointNomme ne redéfinit pas de méthode translater
		System.out.print ("pn1 = "); pn1.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		//pn1 = PN1:(40, 50) 

		// Définir une poignée sur un point
		Point q;

		// Attacher un point à q et l'afficher
		q = p1;				// Est-ce autorisé ? Pourquoi ? q est de type Point et p1 aussi donc OK
		System.out.println ("> q = p1;");
		System.out.print ("q = "); q.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		//q = (13, 14)

		// Attacher un point nommé à q et l'afficher
		q = pn1;			// Est-ce autorisé ? Pourquoi ? car PointNomme hérite de Point
		System.out.println ("> q = pn1;");
		System.out.print ("q = "); q.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		//q = PN1:(40, 50)

		// Définir une poignée sur un point nommé
		PointNomme qn;

		// Attacher un point à q et l'afficher
		/*qn = p1;			// Est-ce autorisé ? Pourquoi ? Impossible car Point n'hérite pas de PointNomme
		System.out.println ("> qn = p1;");
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
*/
		// Attacher un point nommé à qn et l'afficher
		qn = pn1;			// Est-ce autorisé ? Pourquoi ? oui car même type
		System.out.println ("> qn = pn1;");
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		//qn = PN1:(40, 50)

		double d1 = p1.distance (pn1);	// Est-ce autorisé ? Pourquoi ? car PointNomme hérite de Point (conversion de types)
		System.out.println ("distance = " + d1);

		double d2 = pn1.distance (p1);	// Est-ce autorisé ? Pourquoi ? car distance est la méthode de Point 
		//et p1 est de type Point
		System.out.println ("distance = " + d2);

		double d3 = pn1.distance (pn1);	// Est-ce autorisé ? Pourquoi ? oui que 1er cas
		System.out.println ("distance = " + d3);

		/*System.out.println ("> qn = q;");
		qn = q;				// Est-ce autorisé ? Pourquoi ? q est de type apparent Point et de type réel PointNomme, 
		//et qn de type PointNomme, donc le compilateur n'utilisant que les types apparents refuse
		*/
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ?
		//qn = PN1:(40, 50)

		System.out.println ("> qn = (PointNomme) q;");
		qn = (PointNomme) q;		// Est-ce autorisé ? Pourquoi ? oui car PointNomme herite de Point, et q de type réel PN
		System.out.print ("qn = "); qn.afficher(); System.out.println ();

		System.out.println ("> qn = (PointNomme) p1;");
		qn = (PointNomme) p1;		// Est-ce autorisé ? Pourquoi ? autorisé a la compil mais pas a l'exec car p1 est de type réel Point
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
	}

}
