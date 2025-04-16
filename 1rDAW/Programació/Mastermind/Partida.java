package Mastermind;

import java.util.ArrayList;

public class Partida {

	private String nomJugador;
	private char[] codiSecret =  new char[4];
	private ArrayList<Tirada> llistaTirades = new ArrayList();
	private int puntuacioTotal = 0;
	private boolean estatFinal;
	private String codi;
	private String guanyat;
	
	public Partida (String nomJugador, char[] codiSecret, int puntuacioTotal, String guanyat, boolean estatFinal, ArrayList llistaTirades) {
		this.nomJugador = nomJugador;
		this.codiSecret = codiSecret;
		this.puntuacioTotal = puntuacioTotal;
		this.guanyat = guanyat;
		this.estatFinal = estatFinal;
		this.llistaTirades = llistaTirades;
	}
	
	public String getNomJugador() {
		return this.nomJugador = nomJugador;
	}
	
	public char[] getCodiSecret() {
		return this.codiSecret = codiSecret;
	}
	
	public int getPuntuacioTotal() {
		return this.puntuacioTotal = puntuacioTotal;
	}
	
	public boolean getEstatFinal() {
		return this.estatFinal = estatFinal;
	}
	
	public String setGuanyat() {
		return this.guanyat = guanyat;
	}
	
	public int[] comprovar(Tirada tirada) {
		int punts = 0;
		boolean[] comprovar = {false, false, false, false};
		for (int i = 0 ; i < codiSecret.length ; i++) {
			if (codiSecret[i] == tirada.getCodiIntent()[i]) {
				tirada.getResultat()[0]++;
				punts += 2;
				puntuacioTotal = puntuacioTotal + 2;
				comprovar[i] = true;
				
				if (punts == 8) {
					estatFinal = true;
					guanyat = "VICTORIA";
				}
			}
		}
		
		for (int j = 0 ; j < codiSecret.length ; j++) {
			for (int z = 0 ; z < codiSecret.length ; z++) {
				if (j == z)
					continue;
				else if ((codiSecret[j] == tirada.getCodiIntent()[z]) && comprovar[j] != true) {
					tirada.getResultat()[1]++;
					punts += 1;
					puntuacioTotal = puntuacioTotal + 1;
					comprovar[j] = true;
				}
			}
		}
		llistaTirades.add(tirada);
		return tirada.getResultat();
	}
	
	public String toString() {
		String dadesPartida = "";
		dadesPartida = dadesPartida + "\n\n" + "Nom Jugador: "+ nomJugador + "\n" + "Codi Secret: "+ codi.valueOf(codiSecret)+"\n" + "Puntuació final: "+puntuacioTotal+"\n" + "Resultat: " + guanyat+"\n" +"Llista de tirades: "+llistaTirades+"\n";
		return dadesPartida;
	}
}
