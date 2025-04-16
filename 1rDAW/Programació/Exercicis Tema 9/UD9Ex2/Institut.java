package UD9Ex2;

import java.util.Hashtable;
import java.util.Map;
import java.util.Scanner;
import java.util.Vector;

public class Institut {
	
	//Generam el Hashtable que contindrà les persones
	static Hashtable<String,Persona> map = new Hashtable<String,Persona>();
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---MENÚ---");
			System.out.println("1. Nou alumne");
			System.out.println("2. Nou professor");
			System.out.println("3. Mostrar dades");
			System.out.println("4. Sortir del programa");
			System.out.println("Tria una opció (1-4):");
			try{
				opcio = comprovarInt();
				
				switch (opcio) {
				case 1:
					nouAlumne();
					break;
				
				case 2:
					nouProfessor();
					break;
					
				case 3:
					for (Map.Entry i : map.entrySet()) {
						System.out.println(i.getKey()+" "+i.getValue());
					}
					break;
				
				case 4:
					System.out.println("Sortint del programa...");
					System.exit(0);
					break;
				
				default:
					System.out.println("Opció no vàlida!");
				}
			}catch (NumberFormatException e) {
				System.out.println("Error! Has d'introduir un nombre enter entre 1 i 5!");
			}
			
		}while (opcio!=4);
		
	}
	
	public static int comprovarInt() throws NumberFormatException {
		return Integer.parseInt(sc.nextLine());
	}
	
	public static String llegirString(String s) throws RuntimeException {
		if (s.isBlank()) {
			throw new RuntimeException("Error! Hi ha camps en blanc!"+"\n"+"Tornant al menú principal...");
		}
		return s;
	}
	
	
	public static void nouAlumne() {
		
		String nom = "";
		String dni = "";
		int edat = 0;
		String nivell = "";
		Persona alumne;
		
		try {
			System.out.println("Introdueix el nom del professor:");
			nom = sc.nextLine();
			llegirString(nom);
			
			System.out.println("Introdueix el DNI:");
			dni = sc.nextLine();
			llegirString(dni);
			
			System.out.println("Quin nivell està cursant?");
			nivell = sc.nextLine();
			llegirString(nivell);
		}catch(RuntimeException e) {
			e.printStackTrace();
			Institut.main(null);
		}
		
		try{
			System.out.println("Introdueix l'edat:");
			edat = comprovarInt();
		}catch(NumberFormatException e) {
			System.out.println("Error, has d'introduir un nombre enter!"+"\n"+"Tornant al menú principal...");
			Institut.main(null);
		}
		
		//Afegim l'alumne
		map.put(dni, alumne = new Alumne(nom, dni, edat, nivell));

	}
	
	public static void nouProfessor() {
		
		String nom = "";
		String dni = "";
		int edat = 0;
		String assignatura = "";
		Persona professor;
		
		try {
			System.out.println("Introdueix el nom del professor:");
			nom = sc.nextLine();
			llegirString(nom);
			
			System.out.println("Introdueix el DNI:");
			dni = sc.nextLine();
			llegirString(dni);
			
			System.out.println("Quina assignatura està impartint?");
			assignatura = sc.nextLine();
			llegirString(assignatura);
		}catch(RuntimeException e) {
			e.printStackTrace();
			Institut.main(null);
		}
		
		try{
			System.out.println("Introdueix l'edat:");
			edat = comprovarInt();
		}catch(NumberFormatException e) {
			System.out.println("Error, has d'introduir un nombre enter!"+"\n"+"Tornant al menú principal...");
			Institut.main(null);
		}
		
		//Afegim el professor
		map.put(dni, professor = new Profesor(nom, dni, edat, assignatura));
	}

}
