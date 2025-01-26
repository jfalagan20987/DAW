package NewPackage;

import java.util.Scanner;

public class NombreSecret {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner sc = new Scanner(System.in);
		final int NOMBRE_SECRET = 22;
		int nombreUsuari;
		
		System.out.println("Introdueix el nombre que trobes que és:");
		nombreUsuari = sc.nextInt();
		
		if (nombreUsuari == NOMBRE_SECRET) {
			System.out.println("Has endevinat el nombre secret!!!");
		}else {
			System.out.println("NO has endevinat el nombre secret.");
		}
		
		System.out.println("Final del programa");
		
	}

}
