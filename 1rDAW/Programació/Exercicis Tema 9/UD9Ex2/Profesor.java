package UD9Ex2;

public class Profesor extends Persona{
	
	private String assignatura;
	
	public Profesor(String nom, String dni, int edat, String assignatura) {
		super (nom, dni, edat);
		this.assignatura = assignatura;
	}
	
	public String toString() {
		String dadesProfesor = "";
		dadesProfesor = dadesProfesor + "\n DADES PROFESSOR"+"\n Nom: "+nom+"\n DNI: "+dni+"\n Edat: "+edat+"\n Assignatura: "+assignatura;
		return dadesProfesor;
	}

}
