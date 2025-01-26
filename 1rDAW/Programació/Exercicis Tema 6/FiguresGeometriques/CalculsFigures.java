package FiguresGeometriques;

public class CalculsFigures {

	public static void main(String[] args) {
		
		Rectangle re1 = new Rectangle(10, 20, 18, 9);
		Quadrat q1 = new Quadrat(5, 7, 5);
		Cercle c1 = new Cercle(20, 18, 7);
		Rombe ro1 = new Rombe(30, 25, 10, 8, 12);
		
		re1.calculArea();
		re1.calculPerimetre();
		re1.toString();
		System.out.println(re1);
		
		q1.calculArea();
		q1.calculPerimetre();
		q1.toString();
		System.out.println(q1);
		
		c1.calculArea();
		c1.calculPerimetre();
		c1.toString();
		System.out.println(c1);
		
		ro1.calculArea();
		ro1.calculPerimetre();
		ro1.toString();
		System.out.println(ro1);

	}

}
