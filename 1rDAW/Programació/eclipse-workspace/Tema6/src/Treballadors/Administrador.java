package Treballadors;

public class Administrador extends Treballador{
	
	private String selecPersonal;
	private String finances;
	private String vendes;
	
	public Administrador(String nom, double salari, String selecPersonal, String finances, String vendes) {
		super(nom, salari);
		this.selecPersonal = selecPersonal;
		this.finances = finances;
		this.vendes = vendes;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Funcions de l'administrador:");
		System.out.println("Selecció de Personal: "+selecPersonal);
		System.out.println("Gestió financiera: "+finances);
		System.out.println("Gerent de vendes: "+vendes+"\n");
	}
	
	@Override
	public void treballar() {
		System.out.println("Gestiona tasques administratives i documentació. \n");
	}
}
