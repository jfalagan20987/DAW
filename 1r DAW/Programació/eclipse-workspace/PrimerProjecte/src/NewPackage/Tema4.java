package NewPackage;

import java.util.Scanner;

public class Tema4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//Sentence if
		Scanner sc = new Scanner(System.in);
		double preu;
		final double PREU_MINIM = 80;
		final double DESCOMPTE = 10;
		
		System.out.println("Introdueix el preu:");
		preu = sc.nextDouble();
		
		if (preu > 0) {
			if (preu >= PREU_MINIM) {
				preu= preu - preu*DESCOMPTE/100;
			}
			
			System.out.println("El preu final és: " + preu);
		}else {
			System.out.println("El nombre introduït ha de ser positiu.");
		}
	}
}
