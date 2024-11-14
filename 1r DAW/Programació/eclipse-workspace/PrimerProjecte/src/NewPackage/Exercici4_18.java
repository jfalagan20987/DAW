package NewPackage;

import java.util.Scanner;

public class Exercici4_18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introdueix un nombre enter:");
		int num = sc.nextInt();
		
		
		System.out.println("El nombre "+num+" convertit a la base seleccionada és: "+cadena(num));
		
		sc.close();

	}
	
	public static String cadena (int num) {
		Scanner sc2 = new Scanner(System.in);
		System.out.println("Introdueix el nombre enter de la base:");
		int base = sc2.nextInt();
		
		sc2.close();
		
		String impr = "";
		int dividend = num;
		int modul;
		while (dividend > 0) {
			modul = dividend%base;
			dividend = dividend/base;
			impr = modul + impr;
		}
		return impr;
	}

}
