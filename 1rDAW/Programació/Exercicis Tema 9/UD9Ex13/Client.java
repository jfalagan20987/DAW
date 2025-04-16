package UD9Ex13;

public class Client {
	
	private String nom;

	public Client(String nom) {
		this.nom = nom;
	}
	
	public String toString() {
		String dadesClient = "";
		dadesClient = dadesClient + nom;
		return nom;
	}
}
