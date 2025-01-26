package Llibres;

public class Llibre {
	
	private String titol;
	private String autor;
	
	public Llibre(String titol, String autor) {
		this.titol = titol;
		this.autor = autor;
	}
	
	public String toString() {
		return "Títol: " + titol + "\n" + "Autor: " + autor;
	}
	
	public String getTitol() {
		return titol;
	}
	
	public String getAutor() {
		return autor;
	}

}
