package NewPackage;

import java.util.Scanner;

public class Exercici4_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		final double PREU_EXTRA = 2;
		final double PREU_LIMIT = 30;
		double preu;
		
		System.out.print("Introdueix el preu de la compra:");
		preu = sc.nextDouble();
		
		if (preu < PREU_LIMIT) {
			preu += PREU_EXTRA;
		}
		
		System.out.println("El preu final és: " + preu);
		
		
	}

}
