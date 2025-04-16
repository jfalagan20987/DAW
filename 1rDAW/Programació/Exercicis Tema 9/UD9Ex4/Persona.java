package UD9Ex4;

public class Persona {
	
	private String nom;
	private String dni;
	private int edat;
	
	public Persona(String nom, String dni, int edat) {
		this.nom = nom;
		this.dni = dni;
		this.edat = edat;
	}
	
	public String getDni() {
		return this.dni = dni;
	}
	
	public String toString() {
		String dadesPersona = "";
		dadesPersona = dadesPersona +"\n\nDADES PERSONA"+"\nNom: "+nom+"\nDNI: "+dni+"\nEdat: "+edat;
		return dadesPersona;
	}

}
