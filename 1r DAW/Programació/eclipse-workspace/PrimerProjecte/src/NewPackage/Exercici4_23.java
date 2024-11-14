package NewPackage;

import java.util.Scanner;

public class Exercici4_23 {
	
	private static int[] llistaPrimers = null;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		llegirMida();
		comprovarPrimers();

	}
	
	public static void llegirMida() {
		Scanner sc = new Scanner(System.in);
		int numPrimers = 0;
		System.out.println("Introdueix la quantitat de nombres primers que vols trobar:");
		numPrimers = sc.nextInt();
		llistaPrimers = new int[numPrimers];
	}
	
	public static void comprovarPrimers() {
		int numPrimers = llistaPrimers.length;
		for (int num = 2 ; num<=numPrimers ; num++) {
			int divisor=2;
			while (num % divisor != 0) {
				divisor++;
			}
			if (num == divisor) {
				System.out.print(num + " ");
			}
		}
		}

}
