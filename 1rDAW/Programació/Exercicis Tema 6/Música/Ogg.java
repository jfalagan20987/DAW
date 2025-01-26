package Música;

import java.util.Scanner;

public class Ogg extends Musica{
	@Override
	public void reproduir() {
		System.out.println("Reproduint Ogg...");
	}
	
	public void definirDurada() {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Estableix la durada de l'Ogg:");
		super.definirDurada(sc.nextDouble());
	}

}
