package NewPackage;

import java.util.Scanner;

public class Exercici4_24 {
	
	static Scanner sc = new Scanner(System.in);
	
	private static double euros;
	private static double[] moneda = new double[3];

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		llegirEuros();
		llegirMoneda();
		conversor();
		
	}
	
	public static void llegirEuros() {
		System.out.println("Introdueix la quantitat d'euros que vols convertir:");
		euros = sc.nextDouble();
	}
	
	public static void llegirMoneda() {
		double lliures = euros * 0.85;
		double dolars = euros * 1.16;
		double iens = euros * 131.66;
		moneda[0] = lliures;
		moneda[1] = dolars;
		moneda[2] = iens;
	}
	
	public static void conversor() {
		System.out.println("La quantitat de "+euros+"és:");
		System.out.println("Lliures: "+euros+" euros *0.85 = "+ moneda[0]+" lliures.");
		System.out.println("Dòlars: "+euros+" euros *1.16 = "+ moneda[1]+" dòlars.");
		System.out.println("Iens: "+euros+" euros *131.66 = "+ moneda[2]+" iens.");
	}

}
