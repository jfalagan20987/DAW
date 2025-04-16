package Mastermind;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Mastermind {

	static Scanner sc = new Scanner(System.in);
	//Els diferents colors per les combinacions
	static char[] opcions = {'R', 'G', 'Y', 'B', 'M', 'C'};
	
	//ArrayList on s'emmagatzemen les partides
	static ArrayList<Partida> partides = new ArrayList();
	
	public static void main(String[] args) {
	
		int opcio = 0;
		
		do {
			System.out.println("---MASTERMIND---");
			System.out.println("1. Jugar partida.");
			System.out.println("2. Mostrar partides anteriors.");
			System.out.println("3. Sortir");
			System.out.println("Tria una opció (1-3):");
			try {
				opcio=comprovarInt();
				
				switch (opcio) {
				
				case 1:
					generarPartida();
					break;
					
				case 2:
					System.out.println(partides);
					break;
					
				case 3:
					System.out.println("Sortint del programa...");
					break;
				
				default:
					System.out.println("Opció no vàlida!");
				}
			}catch (NumberFormatException e) {
				System.out.println("Error! Has de seleccionar un nombre entre 1, 2 o 3!");
			}
		}while (opcio!=3);

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
	
	//Control d'errors dels colors
	public static char comprovarColor(char c) throws RuntimeException {
		boolean coincidencia = false;
		
		if (c == ' ') {
			throw new RuntimeException("No pots deixar espais en blanc!");
		}
		
		for (int i = 0 ; i < opcions.length ; i++) {
			if (c == opcions[i]) {
				coincidencia = true;
				break;
			}
		}
		
		if (coincidencia == false) {
			throw new RuntimeException("No pots introduir un color que no estigui especificat a la llista");
		}
		
		return c;
	}
	

	public static void generarPartida() {
		
		//Generam un codi secret de colors amb 4 posicions de manera random
		Random r = new Random();
		char[] codiSecret = new char[4];
		for (int i = 0 ; i < codiSecret.length ; i++) {
			codiSecret[i] = opcions[r.nextInt(opcions.length)];
		}
		
		//Variables per generar la partida
		String nomJugador = "";
		int puntuacioTotal = 0;
		boolean estatFinal = false;
		String guanyat = "DERROTA";
		Partida partida;
		ArrayList<Tirada> llistaTirades = new ArrayList();
		
		//Comprovam que el nom del jugador no estigui en blanc
		try {
			System.out.println("Indica el teu nom:");
			nomJugador = sc.nextLine();
			llegirString(nomJugador);
		}catch (RuntimeException e) {
			e.printStackTrace();
			Mastermind.main(null);
		}
	
		partida = new Partida(nomJugador, codiSecret, puntuacioTotal, guanyat, estatFinal, llistaTirades);
		
		//Variables per endevinar el codi secret
		String codi;
		char[] codiIntent = null;
		Tirada tirada;
		
		int numIntents = 0;
		boolean endevinat = false;
		boolean acceptat = true;
		
		do {
			do {
				try {
					System.out.println("Entra la seqüència de colors (R, G, Y, B, M, C):");
					codi = sc.nextLine().toUpperCase();
					
					codiIntent = codi.toCharArray();
					for (int i = 0 ; i < codi.length() ; i++) {
						comprovarColor(codi.charAt(i));
						acceptat = true;
					}
				}catch (RuntimeException e) {
					e.printStackTrace();
					acceptat = false;
				}
				
				if (codiIntent.length != 4) {
					System.out.println("Has d'introduir exactament 4 colors!");
				}
				
			}while (codiIntent.length != 4 || !acceptat);
			
			tirada = new Tirada (codiIntent);
			
			partida.comprovar(tirada);
			tirada.imprimirResultat();
			System.out.println("Intents restants: "+(16-numIntents-1));
			
			
			if (partida.getEstatFinal() == true) {
				endevinat = true;
			}else {
				numIntents++;
			}
		}while(numIntents < 16 && endevinat != true);
		
		if (endevinat == true) {
			System.out.println("Enhorabona! Has guanyat!");
			System.out.println("Puntuació total: "+partida.getPuntuacioTotal());
			partides.add(partida);
		}else {
			System.out.println("S'han acabat els intents! Has perdut!");
			System.out.println("El codi secret era :");
			for (int j = 0 ; j < codiSecret.length ; j++) {
				System.out.print(codiSecret[j] + " ");
			}
			System.out.println();
			System.out.println("Puntuació total: "+partida.getPuntuacioTotal());
			partides.add(partida);
		}
	}

}
