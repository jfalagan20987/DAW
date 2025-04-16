package Ex10_08;

public class Alumne extends Persona{
	
	private String nivell;
	
	public Alumne(String nom, String dni, int edat, String nivell) {
		super(nom, dni, edat);
		this.nivell = nivell;
	}
	
	public String toString() {
		String dadesAlumne = "";
		dadesAlumne = dadesAlumne + "\n DADES ALUMNE"+"\n Nom: "+nom+"\n DNI: "+dni+"\n Edat: "+edat+"\n Nivell: "+nivell;
		return dadesAlumne;
	}

}
