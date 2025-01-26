package Instituto;

public class Persona {
	private String dni;
	private String nom;
	public Persona(String dni, String nom) {
		super();
		this.dni = dni;
		this.nom = nom;
	}
   
	
	public void mostrarDades() {
		System.out.println("Nom: "+nom);
		System.out.println("Dni: "+dni);
	}
	
	
}
