package EjerciciosOO;

public class Persona {
	private String nom;
	private String dni;
	private String edat;
	
	public Persona(String nom, String dni, String edat) {
		super();
		this.nom = nom;
		this.dni = dni;
		this.edat = edat;
	}
	
	public void mostrarDades() {
		System.out.println("Nom: "+nom);
		System.out.println("Dni: "+dni);
		System.out.println("Edat: "+edat);
	}
	
	
	

}
