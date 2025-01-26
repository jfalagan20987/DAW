package NewPackage;

import java.util.Scanner;

public class Exercici4_2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		final int NOMBRE_SECRET1 = 7;
		final int NOMBRE_SECRET2 = 23;
		int nombreUsuari;
		
		System.out.print("Introdueix un nombre entre 0 i 30: ");
		nombreUsuari = sc.nextInt();
		
		if (nombreUsuari >= 0 && nombreUsuari <=30) {
			
			if (nombreUsuari == NOMBRE_SECRET1 || nombreUsuari == NOMBRE_SECRET2) {
				System.out.println("Enhorabona, has endevinat el nombre secret!!!");
			}else {
				System.out.println("NO has endevinat el nombre secret");
			}
		}else {
			System.out.println("Error, el nombre ha de tenir un valor entre 0 i 30.");
		}
	}

}
