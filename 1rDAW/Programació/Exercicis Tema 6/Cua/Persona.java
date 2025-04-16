package Cua;

public class Persona {
	
	private String nom;
	private String dni;
	
	public Persona(String nom, String dni) {
		this.nom = nom;
		this.dni = dni;
	}
	
	public String toString() {
		return "Dades de la persona" + "\n" + "Nom: " + nom + "\n" + "DNI: " + dni + "\n";
	}
	
	public String getNom() {
		return nom;
	}
	
	public String getDni() {
		return dni;
	}
}
