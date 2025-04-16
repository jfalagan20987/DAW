package Examen2024T7i8;

import java.util.Scanner;

public class GestorPuntuacions {
	
	static final int MAX_PUNTUACIONS = 100;
	static Scanner sc = new Scanner(System.in);
	static Puntuacio[] puntuacions = new Puntuacio[100];
	static Puntuacio[] copia = new Puntuacio[100];
	static int index = 0;
	
	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---MENÚ---");
			System.out.println("1. Introduir nova puntuació.");
			System.out.println("2. Mostrar llista de puntuacions per ordre d'arribada.");
			System.out.println("3. Mostrar puntuacions en ordre descendent (Selecció Directa).");
			System.out.println("4. Mostrar llista puntuacions en ordre alfabètic segons cognom (Bombolla).");
			System.out.println("5. Sortir.");
			System.out.println("Tria una opció (1-5):");
			if (sc.hasNextInt() == true) {
				opcio = sc.nextInt();
				sc.nextLine();
			}else {
				System.out.println("Error! Has d'introduir un nombre enter!");
				sc.nextLine();
			}
			
			switch(opcio) {
			
			case 1:
				introduirPuntuacio();
				break;
				
			case 2:
				copia = puntuacions.clone();
				for (int i = 0 ; i < index ; i++) {
					System.out.println(puntuacions[i].toString());
				}
				puntuacions = copia.clone();
				break;
				
			case 3:
				copia = puntuacions.clone();
				puntsDescendent();
				puntuacions = copia.clone();
				break;
			
			case 4:
				copia = puntuacions.clone();
				ordreCognom();
				puntuacions = copia.clone();
				break;
			
			case 5:
				System.out.println("Sortint del programa...");
				break;
			
			default:
				System.out.println("Opció no vàlida!");
			}
		}while(opcio != 5);
		
	}
	
	public static void introduirPuntuacio() {
		
		String nom;
		String cognom;
		int punts = 0;
		String data;
		Puntuacio puntuacio;
		boolean correcte = false;
		
		System.out.println("Indica el nom del jugador:");
		nom = sc.nextLine();
		try {
			Excepcions.llegirString(nom);
		}catch (RuntimeException e){
			e.printStackTrace();
			GestorPuntuacions.main(null);
		}
		
		System.out.println("Indica el seu cognom:");
		cognom = sc.nextLine();
		try {
			Excepcions.llegirString(cognom);
		}catch (RuntimeException e){
			e.printStackTrace();
			GestorPuntuacions.main(null);
		}
		
		do {
			System.out.println("Indica la seva puntuació:");
			if (sc.hasNextInt() == true) {
				punts = sc.nextInt();
				sc.nextLine();
				correcte = true;
			}else {
				System.out.println("Error! Has d'introduir un nombre enter!");
				sc.nextLine();
			}
		}while (correcte != true);
		
		System.out.println("Indica la data de la partida (DD/MM/AAAA):");
		data = sc.nextLine();
		try {
			Excepcions.llegirString(data);
		}catch (RuntimeException e){
			e.printStackTrace();
			GestorPuntuacions.main(null);
		}
		
		puntuacio = new Puntuacio(nom, cognom, punts, data);
		puntuacions[index] = puntuacio;
		index++;
		
	}
	
	public static void puntsDescendent() {
		
		Puntuacio aux;
		int posicioAux;
		
		for (int i = 0 ; i < index ; i++) {
			posicioAux = i;
			
			for (int j = i+1 ; j < index ; j++) {
				if (puntuacions[j].getPunts() > puntuacions[posicioAux].getPunts()) {
					posicioAux = j;
				}
			}
			
			if (posicioAux != i) {
				aux = puntuacions[i];
				puntuacions[i] = puntuacions[posicioAux];
				puntuacions[posicioAux] = aux;
			}
			
			System.out.println(puntuacions[i].toString());
		}
	}
	
	public static void ordreCognom() {
		
		boolean ordenat = true;
		int n = 0;
		
		do {
			boolean canvi = false;
			for (int i = 0 ; i < index ; i++) {
				for (int j = 0 ; j < index - i - 1 ; j++) {
					if (puntuacions[j].getCognom().charAt(n) == puntuacions[j+1].getCognom().charAt(n)) {
						n++;
					}else if (puntuacions[j].getCognom().charAt(n) > puntuacions[j+1].getCognom().charAt(n)) {
						//puntuacions[j].getCognom().compareTo(puntuacions[j+1].getCognom() > 0)
						Puntuacio aux = puntuacions[j];
						puntuacions[j] = puntuacions[j+1];
						puntuacions[j+1] = aux;
						canvi = true;
					}
				}
			}
			
			if (canvi == true) {
				ordenat = false;
			}else {
				ordenat = true;
			}
		}while (ordenat == false);
		
		for (int i = 0 ; i < index ; i++) {
			System.out.println(puntuacions[i].toString());
		}
		
	}

}
