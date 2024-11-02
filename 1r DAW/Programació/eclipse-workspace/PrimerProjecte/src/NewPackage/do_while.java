package NewPackage;

import java.util.Scanner;

public class do_while {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int nombre = 0;
		
		do {
			System.out.println("Introdueix el nombre de mes (1-12):");
			nombre = sc.nextInt();
			
		} while (nombre < 1 || nombre > 12);

		System.out.println("Entrada correcte!");

	}

}
