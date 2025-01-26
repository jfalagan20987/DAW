package NewPackage;

import java.util.Scanner;

public class Exercici4_23 {
	
	static Scanner sc = new Scanner(System.in);
	static int numPrimos = 0;
	static boolean esPrimo = true;
	static int num = 1;
	static int counter = 0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("Introdueix el nombre de primers que vols trobar:");
		numPrimos = sc.nextInt();
		
		while (counter < numPrimos) {
			if (esPrimo(num)) {
				counter++;
				System.out.print(num+" ");
			}
			num++;
		}

	}
	
	public static boolean esPrimo (int num) {
		for (int divisor = num - 1 ; divisor > 1 ; divisor--) {
			if (num % divisor == 0) {
				return false;
			}
		}
		return true;
	}

}
