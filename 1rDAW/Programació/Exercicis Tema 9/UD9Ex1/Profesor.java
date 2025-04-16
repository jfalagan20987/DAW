package UD9Ex1;

public class Profesor extends Persona{
	
	private String assignatura;
	
	public Profesor(String nom, String dni, int edat, String assignatura) {
		super (nom, dni, edat);
		this.assignatura = assignatura;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Assignatura: "+assignatura+"\n");
	}

}
