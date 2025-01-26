package Equip;

public class JugadorPosicio extends Jugador{
	
	private String posicio;
	
	public JugadorPosicio(String nom, double salari, int edat, double altura, String posicio) {
		super(nom, salari, edat, altura);
		this.posicio = posicio;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Posició: "+posicio+"\n");
	}

}
