package NewPackage;

import java.util.Scanner;

public class Exercici4_26 {
	
	static Scanner sc = new Scanner(System.in);
	static String text;
	static int counter = 0;
	static char caracter;
	static char[] cadena;
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		llegirText();
		recompteLletres();

	}
	
	public static void llegirText() {
		System.out.println("Introdueix un text:");
		text = sc.nextLine();
		System.out.println("Lletra	nº rep.");
	}
	
	public static void recompteLletres() {
		
		cadena = text.toCharArray();
		for (int i = 0 ; i < cadena.length ; i++) {
			caracter = cadena[i];
			for (int j = 0 ; j < cadena.length ; j++) {
				if (cadena[j] == caracter) {
					counter++;
				}
			}
			System.out.println(cadena[i]+"\t"+counter);
			counter = 0;
		}
	}

}
