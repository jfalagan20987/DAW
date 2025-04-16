package Llibres;

public class ArmariLlibres{
	
	Llibre[] llibres = new Llibre[100];
	int index = 0;
	
	public void afegirLlibre(Llibre llibre) {
		llibres[index] = llibre;
		index++;
	}
	
	public void eliminarLlibre(Llibre llibre) {
		String comprovar;
		comprovar = llibre.getTitol();
		for (int i = 0 ; i < index ; i++) {
			if (llibres[i] != null) {
				llibres[i].getTitol();
				if (comprovar.equals(llibres[i].getTitol())) {
					llibres[i] = null;
				}
			}
		}
	}
	
	public void modificarLlibre(Llibre llibre) {
		//Aquesta part no me surt!
		String comprovar = "";
		String nouTitol = "";
		String nouAutor = "";
		comprovar = llibre.getTitol();
		for (int i = 0 ; i < index ; i++) {
			llibres[i].getTitol();
			if (comprovar.equals(llibres[i].getTitol())) {
				llibres[i] = null;
				llibre = new Llibre(nouTitol, nouAutor);
				llibres[i] = llibre;
			}
		}
	}
	
	public String toString() {
		String dadesLlibres = "";
		for(int i = 0 ; i < index ; i++) {
			if(llibres[i] != null) {
				dadesLlibres = dadesLlibres + "---DADES LLIBRE---" + "\n" + "Títol: " + llibres[i].getTitol() + "\n" + "Autor: " + llibres[i].getAutor() + "\n";
			}
		}
		return dadesLlibres;
	}
}
