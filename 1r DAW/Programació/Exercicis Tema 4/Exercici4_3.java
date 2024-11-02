package NewPackage;

import java.util.Scanner;

public class Exercici4_3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		double notaFinal;
		
		System.out.print("Quina nota ha tret l'alumne? ");
		notaFinal = sc.nextDouble();
		
		if (notaFinal >= 0 && notaFinal <= 10) {
					
			if (notaFinal >= 9 && notaFinal <=10) {
				System.out.println("Excel·lent!");
			}else if (notaFinal >= 6.5 && notaFinal < 9) {
				System.out.println("Notable!");
			}else if (notaFinal >= 5 && notaFinal < 6.5) {
				System.out.println("Suficient!");
			}else {
				System.out.println("Suspès");
			}
			
		}else {
			System.out.println("La nota ha de ser un nombre entre 0 i 10.");
		}
		
		sc.close();
	}

}
