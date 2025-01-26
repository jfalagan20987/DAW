package NewPackage;

import java.util.Scanner;

public class CercarDivisor_Exercici4_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Introdueix un nombre més gran que 1:");
		int i = sc.nextInt();
		
		boolean trobat = false;
		
		
		for (int divisor = i-1 ; divisor > 1 ; divisor--) {
			if (i%divisor == 0)
				System.out.println("El divisor més gran és: " +divisor);
				trobat = true;
				break;
			}
		
		if (trobat == false) {
			System.out.println("El número " + i + " és primo");
		}
	
	}
	
}
