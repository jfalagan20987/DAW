package RepeticioExamen2024;

public class Puntuacio {

	private String nom;
	private String cognom;
	private int punts;
	private String data;
	
	public Puntuacio(String nom, String cognom, int punts, String data) {
		this.nom = nom;
		this.cognom = cognom;
		this.punts = punts;
		this.data = data;
	}
	
	public String getCognom() {
		return this.cognom = cognom;
	}
	
	public int getPunts() {
		return this.punts = punts;
	}
	
	public String toString() {
		String dadesPuntuacio = "";
		dadesPuntuacio = dadesPuntuacio + "\n"+"Nom: "+nom+"\n"+"Cognom: "+cognom+"\n"+"Punts: "+punts+"\n"+"Data: "+data;
		return dadesPuntuacio;
	}
}
