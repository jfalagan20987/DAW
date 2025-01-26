package NewPackage;

import java.util.Scanner;

public class Exercici4_6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		final double DESCOMPTE = 8;
		final double COMPRA_MIN = 100;
		final double DESC_MAXIM = 10;
		double preu=0;
		
		System.out.print("Quin és el preu del producte? ");
		
		if (sc.hasNextDouble()==true) {
			preu = sc.nextDouble();
		}
		else {
			System.out.println("Tipus de dada introduit és incorrecte!");
		}
		
		if (preu>0) {
			
			if (preu >= COMPRA_MIN) {
				double descompteFet = preu * DESCOMPTE / 100;
				
				if (descompteFet > DESC_MAXIM) {
					descompteFet = DESC_MAXIM;
				}
				
				preu = preu - descompteFet;
			}
			
			System.out.println("El preu final és: " + preu + "euros");
			
		}else {
			System.out.println("El preu del producte no pot ser un valor negatiu!");
		}
		
		
		sc.close();
		
		
	}

}
