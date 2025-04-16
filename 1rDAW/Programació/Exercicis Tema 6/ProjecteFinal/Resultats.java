package ProjecteFinal;

public class Resultats extends Equip{
	
	private int victories;
	private int derrotes;
	private int campionats;
	
	public Resultats(String nomEquip, int victories, int derrotes, int campionats) {
		super(nomEquip);
		this.victories = victories;
		this.derrotes = derrotes;
		this.campionats = campionats;
	}
	
	public String toString() {
		return super.toString() + "Victories: "+victories+"\n"+"Derrotes: "+derrotes+"\n"+"Campionats guanyats: "+campionats+"\n"+"\n";
	}

}
