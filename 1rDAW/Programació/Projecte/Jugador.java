package Projecte;

//Definim elnom i els darrers detalls del jugador
public class Jugador extends Estadistica{
	
	private String nomJugador;
	private int dorsal;
	private String posicio;
	
	public Jugador(String nomEquip, double pts, double reb, double ast, String nomJugador, int dorsal, String posicio) {
		super(nomEquip, pts, reb, ast);
		this.nomJugador = nomJugador;
		this.dorsal = dorsal;
		this.posicio = posicio;
	}
	
	public String getNomJugador() {
		return this.nomJugador = nomJugador;
	}
	
	public int getDorsal() {
		return this.dorsal = dorsal;
	}
	
	public String getPosicio() {
		return this.posicio = posicio;
	}

}
