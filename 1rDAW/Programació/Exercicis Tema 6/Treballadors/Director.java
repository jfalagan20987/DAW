package Treballadors;

public class Director extends Treballador{
	
	private String departament;
	private int anysCarrec;
	
	public Director(String nom, double salari, String departament, int anysCarrec) {
		super(nom, salari);
		this.departament = departament;
		this.anysCarrec = anysCarrec;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Departament que dirigeix: "+departament);
		System.out.println("Temps com a director: "+anysCarrec+" anys \n");
	}
	
	@Override
	public void treballar() {
		System.out.println("Supervisa els equips i pren decisions estratègiques. \n");
	}

}
