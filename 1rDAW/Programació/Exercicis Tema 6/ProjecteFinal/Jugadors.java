package ProjecteFinal;

public class Jugadors extends Equip{
	
	Equip[] jugadors = new Equip[2];
	int index = 0;
	
	private String nomJugador;
	private int dorsal;
	private String posicio;
	
	public Jugadors(String nomEquip, String nomJugador, int dorsal, String posicio) {
		super(nomEquip);
		this.nomJugador = nomJugador;
		this.dorsal = dorsal;
		this.posicio = posicio;
	}

	public void afegirJugador(Equip jugador) {
		if (index < 3) {
			jugadors[index] = jugador;
			index++;
			System.out.println("Jugador registrat!");
			System.out.println("Hi queden "+(3-index)+" places lliures.");
		} else if(index == 3) {
			System.out.println("L'equip està complet!");
		}else if (index == 0) {
			System.out.println("L'equip no té jugadors!");
		}
	}
	
	public String toString() {
		String dadesEquip = "";
		for (int i = 0 ; i < index ; i++) {
			dadesEquip = dadesEquip + "----DADES EQUIP----" + "\n" + "Nom equip: "+ jugadors[i].getNomEquip() + "\n"+"\n" + "JUGADOR "+(i+1)+"\n"+"Nom: " + nomJugador + "\n" + "Dorsal: "+ dorsal + "\n"+ "Posició: " + posicio + "\n"+"\n";
		}
		return dadesEquip;
	}

}
