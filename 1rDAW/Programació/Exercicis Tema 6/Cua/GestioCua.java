package Cua;

import java.util.Scanner;

public class GestioCua {
	
	static Cua entrada = new Cua();

	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---GESTIÓ DE LA CUA---");
			System.out.println("Què vols fer? Tria una opció (1-4):");
			System.out.println("1. Afegir una persona.");
			System.out.println("2. Treure una persona que ja ha entrat.");
			System.out.println("3. Mostrar persones que queden a la cua.");
			System.out.println("4. Sortir del programa.");
			opcio = sc.nextInt();
			sc.nextLine();
			
			switch(opcio) {
			
			case 1:
				afegirPersona();
				break;
			
			case 2:
				entrada.treurePersona();
				break;
				
			case 3:
				System.out.println(entrada);
				break;
				
			case 4:
				System.out.println("Sortint del programa...");
				System.exit(0);
				break;
				
			default:
				System.out.println("Opció incorrecte!");
			}
		}while(opcio != 4);

	}
	
	public static void afegirPersona() {
		
		String nom;
		String dni;
		Persona persona;
		
		System.out.println("Registra el nom de la persona:");
		nom = sc.nextLine();
		
		System.out.println("Indica quin és el seu DNI:");
		dni = sc.nextLine();
		
		persona = new Persona(nom, dni);
		entrada.afegirPersona(persona);
		
	}

}
