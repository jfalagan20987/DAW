package Treballadors;

import java.util.Scanner;

public class GestioTreballadors {
	
	static Treballador[] treballadors = new Treballador[100];
	static int index;
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---MENÚ---");
			System.out.println("1. Afegir nou enginyer");
			System.out.println("2. Afegir nou comercial");
			System.out.println("3. Afegir nou administrador");
			System.out.println("4. Afegir nou director");
			System.out.println("5. Mostrar dades dels treballadors");
			System.out.println("6. Treballar");
			System.out.println("7. Cobrar");
			System.out.println("8. Sortir del programa");
			System.out.println("Tria una opció (1-8):");
			opcio = sc.nextInt();
			sc.nextLine();
			
			switch(opcio) {
			
			case 1:
				nouEnginyer();
				break;
				
			case 2:
				nouComercial();
				break;
				
			case 3:
				nouAdministrador();
				break;
				
			case 4:
				nouDirector();
				break;
			
			case 5:
				if (index > 0) {
					for (int i = 0 ; i < index ; i++) {
						treballadors[i].mostrarDades();
					}
				}else {
					System.out.println("No hi ha cap treballador registrat!\n");
				}
				break;
				
			case 6:
				if (index > 0) {
					for (int i = 0 ; i < index ; i++) {
						treballadors[i].mostrarDades();
						treballadors[i].treballar();
					}
				}else {
					System.out.println("No hi ha cap treballador registrat!\n");
				}
				break;
				
			case 7:
				if (index > 0) {
					for (int i = 0 ; i < index ; i++) {
						treballadors[i].mostrarDades();
						treballadors[i].cobrar();
					}
				}else {
					System.out.println("No hi ha cap treballador registrat!\n");
				}
				break;
			
			case 8:
				System.out.println("Sortint del programa...");
				System.exit(0);
				break;
			
			default:
				System.out.println("Opció no vàlida!");
			}
			
		}while(opcio != 8);
		
	}
	
	public static void nouEnginyer() {
		
		String nom;
		double salari;
		String telecom;
		String tic;
		String medi;
		
		System.out.println("Introdueix el nom de l'enginyer:");
		nom = sc.nextLine();
		
		System.out.println("Introdueix el seu salari:");
		salari = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Funcions relacionades amb la telecomuniació (SI/NO)?");
		telecom = sc.nextLine();
		
		System.out.println("Funcions relacionades amb les TIC (SI/NO)?");
		tic = sc.nextLine();
		
		System.out.println("Funcions relacionades amb el medi ambient (SI/NO)?");
		medi = sc.nextLine();
		
		treballadors[index] = new Enginyer(nom, salari, telecom, tic, medi);
		index++;
	}
	
	public static void nouComercial() {
		
		String nom;
		double salari;
		int numClients;
		
		System.out.println("Introdueix el nom del comercial:");
		nom = sc.nextLine();
		
		System.out.println("Introdueix el seu salari:");
		salari = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Quants de clients ha captat aquest comercial durant el darrer trimestre?:");
		numClients = sc.nextInt();
		sc.nextLine();
		
		treballadors[index] = new Comercial(nom, salari, numClients);
		index++;
	}
	
	public static void nouAdministrador() {
		
		String nom;
		double salari;
		String selecPersonal;
		String finances;
		String vendes;
		
		System.out.println("Introdueix el nom de l'administrador:");
		nom = sc.nextLine();
		
		System.out.println("Introdueix el seu salari:");
		salari = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Funcions relacionades amb la Selecció de Personal (SI/NO)?");
		selecPersonal = sc.nextLine();
		
		System.out.println("Funcions relacionades amb la Gestió de Financiera (SI/NO)?");
		finances = sc.nextLine();
		
		System.out.println("Funcions relacionades amb Gerent de Vendes (SI/NO)?");
		vendes = sc.nextLine();
		
		treballadors[index] = new Administrador(nom, salari, selecPersonal, finances, vendes);
		index++;
	}
	
	public static void nouDirector() {
		
		String nom;
		double salari;
		String departament;
		int anysCarrec;
		
		System.out.println("Introdueix el nom de director:");
		nom = sc.nextLine();
		
		System.out.println("Introdueix el seu salari:");
		salari = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Quin departament està al seu càrrec?");
		departament = sc.nextLine();
		
		System.out.println("Quants anys porta com a director?");
		anysCarrec = sc.nextInt();
		sc.nextLine();
		
		treballadors[index] = new Director(nom, salari, departament, anysCarrec);
		index++;
	}

}
