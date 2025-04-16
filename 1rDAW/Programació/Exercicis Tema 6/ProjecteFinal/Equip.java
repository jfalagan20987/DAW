package ProjecteFinal;

public class Equip {
	
	private String nomEquip;
	
	public Equip(String nomEquip) {
		this.nomEquip = nomEquip;
	}
	
	public String toString() {
		return "----DADES EQUIP----" + "\n" + "Nom equip: "+ nomEquip + "\n";
	}
	
	public String getNomEquip() {
		return this.nomEquip = nomEquip;
	}

}
