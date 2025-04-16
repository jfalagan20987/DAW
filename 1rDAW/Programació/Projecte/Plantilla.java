package Projecte;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Plantilla {
	
	//Array on guardarem els jugadors de cada equip, amb un màxim de tres representants per cadascún
	Jugador[] jugadors = new Jugador[3];
	int index = 0;
	
	//Utilitzaré això per poder rebre missatges diferents a cada jugada i que hi hagi més varietat
	Random r = new Random();
	List listDos = Arrays.asList("Entrada a canasta...", "El jugador demana un aclarat...", "Passa el bloqueig, assisteix i...", "S'esgota la possessió, tir molt forçat...", "Alley-oop...", "Des de mitja distància...");
	List listTres = Arrays.asList("El jugador demana un aclarat...", "Executa un step-back i...", "S'esgota la possessió, tir molt forçat...", "Acció de pick&pop, s'obre el receptor, rep la pilota i...", "On és la defensa? Tira totalment sol i...");
	
	//Mètode per afegir jugadors personalitzats
	public void afegirJugador(Jugador jugador) {
		if (index < 3) {
			jugadors[index] = jugador;
			index++;
			System.out.println("Places restants a l'equip: "+(3-index)+"\n");
		} else if (index >= 3 ) {
			System.out.println("L'equip està complet! No es poden registrar més jugadors!"+"\n");
		}
	}
	
	//Mètode per omplir els dos equips amb els 6 jugadors que venen per defecte amb el programa
	public void afegirPredefinit(Jugador jugador) {
		jugadors[index] = jugador;
		index++;
	}
	
	//Cistella de dos punts
	public void dosPunts() {
		int randomitem = r.nextInt(listDos.size());
	    String randomElement = (String) listDos.get(randomitem);
	    System.out.println("\n"+randomElement);
		System.out.println("CISTELLA DE DOS PUNTS!"+"\n");
	}
	
	//Cistella de tres punts
	public void tresPunts() {
		int randomitem = r.nextInt(listTres.size());
	    String randomElement = (String) listTres.get(randomitem);
	    System.out.println("\n"+randomElement);
		System.out.println("TRIIIIIIPLEEEEEEEE!!!"+"\n");
	}
	
	//Intent de dos punts errat
	public void fallaDos() {
		int randomitem = r.nextInt(listDos.size());
	    String randomElement = (String) listDos.get(randomitem);
	    System.out.println("\n"+randomElement);
		System.out.println("Falla l'intent de cistella." + "\n");
	}
	
	//Intent de tres punts errat
	public void fallaTres() {
		int randomitem = r.nextInt(listTres.size());
	    String randomElement = (String) listTres.get(randomitem);
	    System.out.println("\n"+randomElement);
		System.out.println("Falla el triple." + "\n");
	}
	
	public String toString() {
		String dadesPlantilla = "";
		for (int i = 0 ; i < index ; i++) {
			dadesPlantilla = dadesPlantilla +"\n"+ "Nom: "+jugadors[i].getNomJugador()+ "\n"+"Equip: "+ jugadors[i].getNomEquip() +"\n" +"Punts: "+jugadors[i].getPts()+"\n"+"Rebots: "+jugadors[i].getReb()+"\n"+"Asistències: "+jugadors[i].getAst()+"\n" +"Dorsal: "+ jugadors[i].getDorsal()+"\n"+"Posició: "+jugadors[i].getPosicio()+"\n";
		}
		return dadesPlantilla;
	}

}
