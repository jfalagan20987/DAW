package UD9Ex8;

import java.util.LinkedList;
import java.util.Scanner;

import UD9Ex4.GestioPersones;

public class CuaPersones {

	//Declaram el LinkedList
	static LinkedList<Persona> cua = new LinkedList<Persona>();
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			mostrarMenu();
			try {
				opcio = comprovarInt();
				
				switch(opcio) {
				
				case 1:
					afegirPersona();
					break;
					
				case 2:
					eliminarPersona();
					break;
					
				case 3:
					//Quan sigui necessari, comprovam que no estigui buit
					if(cua.isEmpty()) {
						System.out.println("No queda ningú a la cua!\n");
					}else {
						System.out.println("\nEstat de la cua:");
						System.out.println(cua);
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
		}while(opcio != 4);
		
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
	
	public static void mostrarMenu() {
		System.out.println("---GESTIÓ DE LA CUA---");
		System.out.println("1. Afegir una persona.");
		System.out.println("2. Fer entrar a la primera persona de la cua.");
		System.out.println("3. Mostrar persones que queden a la cua.");
		System.out.println("4. Sortir del programa.");
		System.out.println("Tria una opció (1-4):");
	}
	
	public static void afegirPersona() {
		
		String nom = "";
		String dni = "";
		Persona persona;
		
		try {
			System.out.println("Introdueix el seu nom:");
			nom = sc.nextLine();
			llegirString(nom);
			
			System.out.println("Introdueix el seu DNI:");
			dni = sc.nextLine();
			llegirString(dni);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			CuaPersones.main(null);
		}
		
		cua.add(persona = new Persona(nom, dni));
		System.out.println("Persona registrada!\n");
	}
	
	public static void eliminarPersona() {
		
		if(cua.isEmpty()) {
			System.out.println("No queda ningú a la cua!\n");
		}else {
			String nom = "";
			String dni = "";
			
			System.out.println("Qui és el següent a entrar? Identificació, per favor!\n");
			try {
				System.out.println("Introdueixi el seu nom:");
				nom = sc.nextLine();
				llegirString(nom);
				
				System.out.println("Introdueixi el seu DNI:");
				dni = sc.nextLine();
				llegirString(dni);
				
			}catch(RuntimeException e) {
				e.printStackTrace();
				CuaPersones.main(null);
			}
			
			if (cua.peekFirst().getNom().equals(nom) && cua.peekFirst().getDni().equals(dni)) {
				System.out.println("Identifiació correcte! Pot passar...\n");
				cua.removeFirst();
			}else {
				System.out.println("Error! Té gent al davant, esperi el seu torn!\n");
			}
		}
		
	}

}
