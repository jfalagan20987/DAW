package NewPackage;

import java.util.Scanner;

public class DemanaN_Primers {
	
	static Scanner sc = new Scanner(System.in);
	static int num = 1;
	static boolean esPrimo = true;
	static int numPrimos = 0;
	static int primosTrobats = 0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("Introdueix el número de primos que vols trobar:");
		numPrimos = sc.nextInt();
		
		while (primosTrobats < numPrimos) {
			if (esPrimo(num)) {
				primosTrobats++;
				System.out.print(num + " ");
			}
			
			num++;
		}

	}
	
	public static boolean esPrimo (int num) {
		for (int i = num-1 ; i>1 ; i--) {
			if (num % i == 0) {
				return false;
			}
		}
		
		return true;
		}

}
