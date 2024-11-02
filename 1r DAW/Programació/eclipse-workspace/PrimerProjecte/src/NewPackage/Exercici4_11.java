package NewPackage;

import java.util.Scanner;

public class Exercici4_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int mes = 0;
		
		do {
			System.out.println("Introdueix un nombre de mes (1 a 12):");
			mes = sc.nextInt();
			
		} while (mes < 1 || mes > 12);
		System.out.println("Dada correcte!");
		
		switch (mes) {
		
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			System.out.println("El mes tindrà 31 dies.");
			break;
		case 2:
			System.out.println("El mes tindrà 28 o 29 dies.");	
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			System.out.println("El mes tindrà 30 dies.");
			break;
		default:
			System.out.println("Opció incorrecta");
		}
		
		sc.close();

	}

}
