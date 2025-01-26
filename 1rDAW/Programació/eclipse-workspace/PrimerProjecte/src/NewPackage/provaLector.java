package NewPackage;

import java.util.Scanner;

public class provaLector {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner lector = new Scanner(System.in);
		
		String frase = "";
		
		System.out.println("Introdueix una frase:");
		frase = lector.nextLine();
		System.out.println("El darrer caràcter és: " + frase.charAt(frase.length()-1));
		lector.close();
		System.out.println(frase.toUpperCase());

	}

}
