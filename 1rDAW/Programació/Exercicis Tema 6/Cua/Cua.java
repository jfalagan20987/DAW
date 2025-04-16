package Cua;

public class Cua {
	
	Persona[] persones = new Persona[100];
	int index = 0;
	
	public void afegirPersona(Persona persona) {
		persones[index] = persona;
		index++;
	}
	
	public void treurePersona() {
		
		if (index > 0) {
			for (int i = 0 ; i < index ; i++) {
				persones[i] = persones[i+1];
			}
			index--;
		}else {
			System.out.println("No hi ha ningú a la cua.");
		}
		
	}
	
	public String toString() {
		String estatCua = "";
		if (index > 0) {
			for (int i = 0 ; i < index ; i++) {
				estatCua = estatCua + "\n" + "Dades de la persona" + "\n" + "Nom: " + persones[i].getNom() + "\n" + "DNI: " + persones[i].getDni() + "\n" + "Posició a la cua: " + (i+1) + "\n";
			}
		}else {
			estatCua = estatCua + "\n" + "No hi ha ningú a la cua." + "\n";
		}
		return estatCua;
	}
}
