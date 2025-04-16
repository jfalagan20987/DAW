package Ex10_08;

import java.io.Serializable;

public class Persona implements Serializable{
	
	protected String nom;
	protected String dni;
	protected int edat;
	
	public Persona(String nom, String dni, int edat) {
		this.nom = nom;
		this.dni = dni;
		this.edat = edat;
	}

}
