package Persona;

public class Persona {
	
	private String nom;
	private String dni;
	private int edat;
	
	public Persona(String nom, String dni, int edat) {
		this.nom = nom;
		this.dni = dni;
		this.edat = edat;
	}
	
	public void mostrarDades() {
		System.out.println("---Dades de la persona---");
		System.out.println("Nom: "+nom);
		System.out.println("DNI: "+dni);
		System.out.println("Edat: "+edat+" anys");
	}

}
