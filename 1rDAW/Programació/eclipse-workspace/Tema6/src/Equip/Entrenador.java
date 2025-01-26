package Equip;

public class Entrenador extends Membre{
	
private int anysContracte;
	
	public Entrenador(String nom, double salari, int edat, int anysContracte) {
		super(nom, salari, edat);
		this.anysContracte = anysContracte;
	}
	
	public void mostrarDades() {
		System.out.println("Dades de l'entrenador:");
		super.mostrarDades();
		System.out.println("Anys de contracte restants: "+anysContracte+" anys");
	}

}
