package Treballadors;

public class Treballador {
	
	String nom;
	double salari;
	
	public Treballador(String nom, double salari) {
		this.nom = nom;
		this.salari = salari;
	}
	
	public void mostrarDades() {
		System.out.println("---DADES TREBALLADOR---");
		System.out.println("Nom: "+nom);
		System.out.println("Salari: "+salari+" €");
	}
	
	public void cobrar() {
		System.out.println("El treballador ha cobrat el seu salari. \n");
	}
	
	public String getNom() {
		return this.nom;
	}
	
	public double getSalari() {
		return this.salari;
	}
	
	public void treballar() {
		System.out.println("Aquest treballador realitza tasques generals. \n");
	}

}
