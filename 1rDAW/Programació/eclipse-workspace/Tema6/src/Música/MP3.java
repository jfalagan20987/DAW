package Música;

import java.util.Scanner;

public class MP3 extends Musica{
	@Override
	public void reproduir() {
		System.out.println("Reproduint MP3...");
	}
	
	public void definirDurada() {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Estableix la durada de l'MP3:");
		super.definirDurada(sc.nextDouble());
	}

}
