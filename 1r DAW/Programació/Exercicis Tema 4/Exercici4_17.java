package NewPackage;

import java.util.Scanner;

public class Exercici4_17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introdueix un nombre enter:");
		int num = sc.nextInt();
		
		System.out.println("El nombre binari és: "+binari(num));
		
		sc.close();

	}
	
	public static String binari (int num) {
		String impr = "";
		int divisor = 2;
		int dividend = num;
		int modul;
		while (dividend > 0) {
			modul = dividend%divisor;
			dividend = dividend/divisor;
			impr = modul + impr;
		}
		return impr;
	}

}
