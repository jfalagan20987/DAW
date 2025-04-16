package UD9Ex11;

import java.util.HashMap;
import java.util.Scanner;

import UD9Ex8.CuaPersones;

public class UD9Ex11 {

	static HashMap<String,Integer> contactes = new HashMap();
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---LLISTA DE CONTACTES---");
			System.out.println("1. Mostrar contactes.");
			System.out.println("2. Afegir nou contacte.");
			System.out.println("3. Buscar un contacte.");
			System.out.println("4. Sortir del programa.");
			System.out.println("Tria una opció (1-4):");
			try {
				opcio = comprovarInt();
				
				switch(opcio) {
				
				case 1:
					//Quan haguem de treu informació del HashMap, sempre comprovam que no estigui buit
					if (contactes.isEmpty()) {
						System.out.println("\nNo tens cap contacte registrat a la teva agenda!\n");
					}else {
						for(String i : contactes.keySet()) {
							System.out.println("\nNom: "+i);
							System.out.println("Telèfon: "+contactes.get(i));
						}
					}
					break;
					
				case 2:
					afegirContacte();
					break;
					
				case 3:
					if (contactes.isEmpty()) {
						System.out.println("\nNo tens cap contacte registrat a la teva agenda!\n");
					}else {
						buscarContacte();
					}
					break;
					
				case 4:
					System.out.println("Sortint del programa...");
					break;
					
				default:
					System.out.println("Opció no vàlida!");
				}
			}catch (NumberFormatException e) {
				System.out.println("Error! Has d'introduir un nombre enter entre 1 i 4!");
			}
		}while(opcio!=4);

	}
	
	//Control d'errors per nombres enters
	public static int comprovarInt() throws NumberFormatException{
		return Integer.parseInt(sc.nextLine());
	}
	
	//Control d'errors per Strings
	public static String llegirString(String s) throws RuntimeException {
		if (s.isBlank()) {
			throw new RuntimeException("Error! Hi ha camps en blanc!"+"\n"+"Tornant al menú principal...");
		}
		return s;
	}
	
	public static void afegirContacte() {
		
		String nom = "";
		Integer nombre = 0;
		
		try {
			System.out.println("Introduiex el seu nom:");
			nom = sc.nextLine().toUpperCase();
			llegirString(nom);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			UD9Ex11.main(null);
		}
		
		try {
			System.out.println("Registra el seu nombre de telèfon:");
			nombre = comprovarInt();
		}catch (NumberFormatException e) {
			System.out.println("Error! Has d'introduir un nombre enter!"+"\nTornant al menú principal...\n");
			UD9Ex11.main(null);
		}
		
		contactes.put(nom, nombre);
		System.out.println("Contacte registrat!\n");
	}
	
	public static void buscarContacte() {
		
		String nom = "";
		boolean trobat = false;
		
		try {
			System.out.println("Introduiex el nom del contacte:");
			nom = sc.nextLine().toUpperCase();
			llegirString(nom);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			UD9Ex11.main(null);
		}
		
		//Mateix bucle que el de mostrar tota la llista
		for (String i : contactes.keySet()) {
			if(i.equals(nom)) {
				trobat = true;
				System.out.println("El seu nombre de telèfon és: "+contactes.get(i)+"\n");
			}
		}
		
		//Si no s'ha trobat coincidència, s'imprimeix aquest missatge
		if (!trobat) {
			System.out.println("No s'ha trobat cap contacte amb aquest nom!\n");
		}
	}

}
