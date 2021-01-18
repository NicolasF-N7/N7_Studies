public class Triangle {

    public static void main(String[] args) {
	Point p1=new Point(3,2);
	Point p2=new Point(11,4);
	Point p3=new Point(6,9);
	Point p4=new Point((p1.getX()+p2.getX()+p3.getX())/3, (p1.getY()+p2.getY()+p3.getY())/3);

	Segment sbas=new Segment(p1, p2);
	Segment sdroite=new Segment(p2,p3);
	Segment sgauche=new Segment(p1,p3);
	p4.afficher();
  }
}

