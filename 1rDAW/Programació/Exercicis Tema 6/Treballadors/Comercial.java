package Treballadors;

public class Comercial extends Treballador{
	
	private int numClients;
	
	public Comercial(String nom, double salari, int numClients) {
		super(nom, salari);
		this.numClients = numClients;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Clients darrer trimestre: "+numClients+"\n");
	}
	
	@Override
	public void treballar() {
		System.out.println("Atén clients i genera vendes. \n");
	}

}
