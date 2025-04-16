package UD9Ex8;

public class Persona {

	private String nom;
	private String dni;
	
	public Persona(String nom, String dni) {
		this.nom = nom;
		this.dni = dni;
	}
	
	public String getNom() {
		return this.nom = nom;
	}
	
	public String getDni() {
		return this.dni = dni;
	}
	
	public String toString() {
		String dadesPersona = "";
		dadesPersona = dadesPersona + "\n\nDADES PERSONA"+"\nNom: "+nom+"\nDNI: "+dni;
		return dadesPersona;
	}
}
