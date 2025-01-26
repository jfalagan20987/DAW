package Música;

public abstract class Musica {
	private double durada;
	
	public void definirDurada(double durada) {
		this.durada = durada;
		System.out.println("La durada és de "+durada+" minuts.");
	}
	
	public abstract void reproduir();

}
