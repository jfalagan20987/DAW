package ExercicisT6;

public class Persona {
	
	//Declaram variables
	private String dni;
	private String nom;
	private short edat;
	
	//Setters i getters
	public void setDni (String dni) {
		this.dni = dni;
	}
	
	public String getDni() {
		return this.dni;
	}
	
	public void setNom (String nom) {
		this.nom = nom;
	}
	
	public String getNom() {
		return this.nom;
	}
	
	public void setEdat (short edat) {
		this.edat = edat;
	}
	
	public short getEdat() {
		return this.edat;
	}
	
	//Mètodes
	public void imprimirDades() {
		System.out.println("DNI..........: "+dni);
		System.out.println("Nom..........: "+nom);
		System.out.println("Edat.........: "+edat);
	}
}
