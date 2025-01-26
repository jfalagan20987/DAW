package Treballadors;

public class Enginyer extends Treballador{
	
	private String telecom;
	private String tic;
	private String medi;
	
	public Enginyer(String nom, double salari, String telecom, String tic, String medi) {
		super(nom, salari);
		this.telecom = telecom;
		this.tic = tic;
		this.medi = medi;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Funcions de l'enginyer:");
		System.out.println("Telecomunicacions: "+telecom);
		System.out.println("TIC: "+tic);
		System.out.println("Medi ambient: "+medi+"\n");
	}
	
	@Override
	public void treballar() {
		System.out.println("Resol problemes tècnics i dissenya solucions. \n");
	}

}
