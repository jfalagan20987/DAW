package NewPackage;

import java.util.Scanner;

public class Exercici4_17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introdueix un nombre enter:");
		int nombre = sc.nextInt();
		int modul = nombre%2;
		
		int[] binari;
		
		for (int dividend = 1 ; dividend <= nombre ; dividend = dividend*2+modul) {
			System.out.println(modul);
		}
		
		}
	
	}