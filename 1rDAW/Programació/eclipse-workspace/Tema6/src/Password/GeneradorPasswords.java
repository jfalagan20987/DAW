package Password;

import java.util.Scanner;

public class GeneradorPasswords {
	
	static Scanner sc = new Scanner(System.in);
	static private Password[] password = new Password[1000];

	public static void main(String[] args) {
		
		int longitud = 0;
		int numPassword = 0;
		boolean esRobust = false;
		
		System.out.println("Quantes contrasenyes vol introduir?");
		numPassword = sc.nextInt();
		
		System.out.println("Estableixi la longitud de la contrasenya:");
		longitud = sc.nextInt();
		
		for (int i = 0 ; i < numPassword ; i++) {
			esRobust = password[i].esRobust();
			password[i].mostrarDades(esRobust);
		}

	}

}
