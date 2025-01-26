package Equip;

public class RolEntrenador extends Entrenador{
	
	private String rol;
	
	public RolEntrenador(String nom, double salari, int edat, int anysContracte, String rol) {
		super(nom, salari, edat, anysContracte);
		this.rol = rol;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Rol: "+rol+"\n");
	}

}
