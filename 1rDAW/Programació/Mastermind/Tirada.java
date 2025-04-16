package Mastermind;

public class Tirada {

	private char[] codiIntent = new char[4];
	private int[] resultat = new int[2];
	private int puntuacioTirada;
	private String codi;
	
	public Tirada (char[] codiIntent) {
		this.codiIntent = codiIntent;
	}
	
	public char[] getCodiIntent() {
		return this.codiIntent = codiIntent;
	}
	
	public int getPuntuacioTirada() {
		return this.puntuacioTirada = puntuacioTirada;
	}
	
	public int[] getResultat() {
		return this.resultat = resultat;
	}
	
	public void imprimirResultat() {
		System.out.println("BLACK: "+resultat[0]);
		System.out.println("WHITE: "+resultat[1]);
		System.out.println("\n");
	}
	
	public String toString() {
		String dadesTirada = "";
		dadesTirada = dadesTirada + "Tirada: "+codi.valueOf(codiIntent)+"\n";
		return dadesTirada;
	}
}
