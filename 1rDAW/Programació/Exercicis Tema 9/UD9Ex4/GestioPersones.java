package UD9Ex4;

import java.nio.file.spi.FileSystemProvider;
import java.util.ArrayList;
import java.util.Scanner;

public class GestioPersones {

	static Scanner sc = new Scanner(System.in);
	
	//Generam un nou ArrayList
	static ArrayList<Persona> persones = new ArrayList<Persona>();
	
	public static void main(String[] args) {
		
		//Generam i registram tres noves persones
		Persona p1 = new Persona("Shai Gilgeous-Alexander", "41215643M", 26);
		Persona p2 = new Persona("Jalen Williams", "41517800D", 23);
		Persona p3 = new Persona("Chet Holmgren", "43199876P", 22);
		
		persones.add(p1);
		persones.add(p2);
		persones.add(p3);
		
		ArrayList<Persona> original = (ArrayList<Persona>) persones.clone();
		
		int opcio = 0;
		
		do {
			mostrarMenu();
			try {
				opcio = comprovarInt();
				
				switch(opcio) {
				
				case 1:
					System.out.println(original);
					break;
					
				case 2:
					afegirPersona();
					System.out.println(persones);
					break;
					
				case 3:
					eliminarPersona();
					System.out.println(persones);
					break;
					
				case 4:
					System.out.println("Sortint del programa...");
					break;
					
				default:
					System.out.println("Opció no vàlida!");
				}
			}catch (NumberFormatException e) {
				System.out.println("Error! Has d'introduir un nombre enter entre 1 i 6!");
			}
		}while(opcio!=4);
	}
	
	//Control d'errors per a nombres enters
	public static int comprovarInt() throws NumberFormatException {
		return Integer.parseInt(sc.nextLine());
	}
	
	//Control de que no hi hagi Strings en blanc
	public static String llegirString(String s) throws RuntimeException {
		if (s.isBlank()) {
			throw new RuntimeException("Error! Hi ha camps en blanc!"+"\n"+"Tornant al menú principal...");
		}
		return s;
	}

	public static void mostrarMenu() {
		
		System.out.println("---MENÚ---");
		System.out.println("1. Mostrar la llista original.");
		System.out.println("2. Afegir una nova persona a la llista.");
		System.out.println("3. Eliminar una persona de la llista.");
		System.out.println("4. Sortir del programa.");
		System.out.println("Tria una opcio (1-4):");
	}
	
	public static void afegirPersona() {
		
		String nom = "";
		String dni = "";
		int edat = 0;
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
			GestioPersones.main(null);
		}
		
		try {
			System.out.println("Introdueix la seva edat:");
			edat = comprovarInt();
		}catch(NumberFormatException e) {
			System.out.println("Error! Has d'introduir un nombre enter!"+"\nTornant al menú principal...");
			GestioPersones.main(null);
		}
		
		persones.add(persona = new Persona(nom, dni, edat));
	}
	
	public static void eliminarPersona() {
		
		String dni = "";
		boolean eliminat = false;
		
		try {
			System.out.println("Introdueix el DNI de la persona que vols eliminar:");
			dni = sc.nextLine();
			llegirString(dni);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			GestioPersones.main(null);
		}
		
		for(int i = 0 ; i < persones.size() ; i++) {
			if(persones.get(i).getDni().equals(dni)) {
				persones.remove(i);
				eliminat = true;
				System.out.println("Persona eliminada!");
			}
		}
		
		if (eliminat != true) {
			System.out.println("No s'ha trobat cap persona amb aquest DNI.");
		}
	}

}
