package UD9Ex13;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Scanner;

import UD9Ex8.CuaPersones;

public class GestioLlibreria {
	
	static LinkedList<Llibre> llibres = new LinkedList();
	static HashSet<Client> clients = new HashSet();
	static HashMap<Llibre, Integer> inventari = new HashMap();
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		//Afegim dades per defecte
		Llibre llibre1 =  new Llibre("La espada del destino");
		llibres.add(llibre1);
		Llibre llibre2 = new Llibre("El último deseo");
		llibres.add(llibre2);
		Llibre llibre3 = new Llibre("La sangre de los elfos");
		llibres.add(llibre3);
		Llibre llibre4 = new Llibre("Tiempo de odio");
		llibres.add(llibre4);
		Llibre llibre5 = new Llibre("Bautismo de fuego");
		llibres.add(llibre5);
		Llibre llibre6 = new Llibre("La torre de la Golondrina");
		llibres.add(llibre6);
		Llibre llibre7 = new Llibre("La dama del lago");
		llibres.add(llibre7);
		Llibre llibre8 = new Llibre("Camino sin retorno");
		llibres.add(llibre8);
		Llibre llibre9 = new Llibre("Estación de tormentas");
		llibres.add(llibre9);
		
		inventari.put(llibre1, 2);
		inventari.put(llibre2, 4);
		inventari.put(llibre3, 1);
		inventari.put(llibre4, 3);
		inventari.put(llibre5, 6);
		inventari.put(llibre6, 1);
		inventari.put(llibre7, 4);
		inventari.put(llibre8, 3);
		inventari.put(llibre9, 1);
		
		Client client1 = new Client("Josep");
		clients.add(client1);
		Client client2 = new Client("Shai");
		clients.add(client2);
		Client client3 = new Client("Jalen");
		clients.add(client3);
		Client client4 = new Client("Chet");
		clients.add(client4);
		
		//Implementam el menú
		int opcio = 0;
		
		do {
			mostrarInventari();
			
			try {
				opcio = comprovarInt();
				
				switch(opcio) {
				
				case 1:
					identificar();
					break;
					
				case 2:
					System.out.println("Sortint del programa...");
					break;
					
				default:
					System.out.println("Opció no vàlida!");
				}
			}catch (NumberFormatException e) {
				System.out.println("Error! Has de seleccionar 1 o 2!");
			}
		}while(opcio!=2);
		
	}
	
	//Control d'errors per nombres enters
	public static int comprovarInt() throws NumberFormatException{
		return Integer.parseInt(sc.nextLine());
	}
	
	//Control d'errors per Strings
	public static String llegirString(String s) throws RuntimeException {
		if (s.isBlank()) {
			throw new RuntimeException("Error! Hi ha camps en blanc!"+"\n"+"Tornant al menú...");
		}
		return s;
	}
	
	//Inventari
	public static void mostrarInventari() {
		
		System.out.println("INVENTARI DE LLIBRES\n");
		
		for (Llibre i : inventari.keySet()) {
			if (inventari.get(i) > 0) {
				System.out.println(i+ "\nQuantitat: " +inventari.get(i)+"\n");
			}
		}
		System.out.println("Què vols fer?");
		System.out.println("1. Comprar");
		System.out.println("2. Sortir");
		
	}
	
	//Identificar client
	public static void identificar() {
		
		String nom = "";
		boolean trobat = false;
		
		int opcio = 0;
		
		System.out.println("\nPer comprar necessites iniciar sessió.");
		System.out.println("1. Identificar-se.");
		System.out.println("2. Registrar-se.");
		
		try {
			opcio = comprovarInt();
			
			switch(opcio) {
			
			case 1:
				try {
					System.out.println("Introdueix el teu nom:");
					nom = sc.nextLine();
					llegirString(nom);
					
				}catch(RuntimeException e) {
					e.printStackTrace();
					GestioLlibreria.identificar();
				}
				
				for (Client i : clients) {
					if(i.toString().equals(nom)) {
						trobat = true;
						break;
					}
				}
				
				if (trobat == true) {
					System.out.println("\nDades correctes! Benvingut!\n");
					comprar();	
				}else {
					System.out.println("No existeix cap client registrat amb aquest nom.");
					System.out.println("Tornant al menú d'inici de sessió...");
					GestioLlibreria.identificar();
				}
				break;
				
			case 2:
				registre();
				break;
				
			default:
				System.out.println("Opció no vàlida!");
			}
		}catch (NumberFormatException e) {
			System.out.println("Error! Has de seleccionar 1 o 2!");
		}

	}
	
	//Registre
	public static void registre() {
		
		String nom = "";
		Client client;
		boolean trobat = false;
		
		System.out.println("\nREGISTRE DE NOU CLIENT");
		
		try {
			System.out.println("Introdueix el teu nom:");
			nom = sc.nextLine();
			llegirString(nom);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			GestioLlibreria.registre();
		}
		
		client = new Client(nom);
		
		for (Client i : clients) {
			if(i.toString().equals(nom)) {
				trobat = true;
				break;
			}
		}
		
		if (trobat) {
			System.out.println("Error! Vostè ja està registrat!");
			System.out.println("Tornant al menú d'inici de sessió...");
			GestioLlibreria.identificar();
		}else {
			client = new Client(nom);
			clients.add(client);
			System.out.println("Registre completat!");
			System.out.println("Tornant al menú d'inici de sessió...");
			GestioLlibreria.identificar();
		}
		
	}
	
	//Compra
	public static void comprar() {
		
		String titol = "";
		Llibre llibre;
		Integer quantitat = 0;
		Integer quantitatFinal;
		boolean llibreTrobat = false;
		
		try {
			System.out.println("\nIndiqui el títol del llibre que vol comprar:");
			titol = sc.nextLine();
			llegirString(titol);
			
		}catch(RuntimeException e) {
			e.printStackTrace();
			GestioLlibreria.comprar();
		}
		
		llibre = new Llibre(titol);
		
		try {
			System.out.println("Indiqui la quantitat:");
			quantitat = comprovarInt();
		}catch (NumberFormatException e) {
			System.out.println("Error! Has d'introduir un nombre enter!");
			GestioLlibreria.comprar();
		}
		
		for (Llibre i : inventari.keySet()) {
			if(i.toString().equals(titol)) {
				llibreTrobat=true;
				if (quantitat <= inventari.get(i)) {
					System.out.println("\nCompra realitzada.");
					quantitatFinal = inventari.get(i) - quantitat;
					inventari.replace(i, quantitatFinal);
				}else {
					System.out.println("\nEns sap greu, però no hi ha prou existencies.\n");
					GestioLlibreria.comprar();
				}
			}
		}
		
		if (!llibreTrobat) {
			System.out.println("\nAquest llibre no es troba a la biblioteca.");
			GestioLlibreria.comprar();
		}
	}

}
