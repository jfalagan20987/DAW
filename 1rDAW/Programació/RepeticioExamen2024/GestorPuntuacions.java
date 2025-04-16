package RepeticioExamen2024;

import java.util.Scanner;

public class GestorPuntuacions {
	
	static Scanner sc = new Scanner(System.in);
	static final int MAX_PUNTUACIONS = 100;
	static Puntuacio[] puntuacions = new Puntuacio[MAX_PUNTUACIONS];
	static Puntuacio[] copia = new Puntuacio[MAX_PUNTUACIONS];
	static int index = 0;

	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			mostrarMenu();
			try {
				opcio = comprovarInt();
				
				switch (opcio) {
				
				case 1:
					introduirPuntuacio();
					break;
					
				case 2:
					copia = puntuacions.clone();
					ordreEntrada();
					puntuacions = copia.clone();
					break;
					
				case 3:
					copia = puntuacions.clone();
					puntsDesc();
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
				}
			}catch (NumberFormatException e) {
				System.out.println("Error! Has d'introduir un nombre enter entre 1 i 5!");
			}
		}while(opcio!=5);

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
	
	public static void mostrarMenu() {
		
		System.out.println("---MENÚ---");
		System.out.println("1. Introduir nova puntuació.");
		System.out.println("2. Mostrar llista de puntuacions per ordre d'arribada.");
		System.out.println("3. Mostrar puntuacions en ordre descendent (Selecció Directa).");
		System.out.println("4. Mostrar llista puntuacions en ordre alfabètic segons cognom (Bombolla).");
		System.out.println("5. Sortir.");
		System.out.println("Tria una opció (1-5):");
	}
	
	public static void introduirPuntuacio() {
		
		String nom = "";
		String cognom = "";
		int punts = 0;
		String data = "";
		
		if (index < MAX_PUNTUACIONS) {
			
			try {
				System.out.println("Introdueix el nom:");
				nom = sc.nextLine();
				llegirString(nom);
				
				System.out.println("Introdueix el cognom:");
				cognom = sc.nextLine();
				llegirString(cognom);
				
				System.out.println("Introdueix la data (DD-MM-AAAA):");
				data = sc.nextLine();
				llegirString(data);
			}catch(RuntimeException e) {
				e.printStackTrace();
				GestorPuntuacions.main(null);
			}
			
			try {
				System.out.println("Per últim, introdueix la puntuació:");
				punts = comprovarInt();
			}catch (NumberFormatException e) {
				System.out.println("Error! Has d'introduir un nombre enter!"+"\n"+"Tornant al menú principal...");
				GestorPuntuacions.main(null);
			}
			
			Puntuacio puntuacio = new Puntuacio(nom, cognom, punts, data);
			puntuacions[index] = puntuacio;
			index++;
		}else {
			System.out.println("Ja hi ha 100 puntuacions registrades! Has arribat al limit!");
		}

	}
	
	public static void ordreEntrada() {
		
		if (index > 0) {
			for (int i = 0 ; i < index ; i++) {
				System.out.println(puntuacions[i].toString());
			}
		}else {
			System.out.println("Error! No hi ha cap puntuació registrada!");
		}
	}
	
	public static void puntsDesc() {
		
		if (index > 0) {
			for (int i = 0 ; i < index ; i++) {
				int posicioAux = i;
				for (int j = i+1 ; j < index ; j++) {
					if (puntuacions[j].getPunts() > puntuacions[posicioAux].getPunts()) {
						posicioAux = j;
					}
				}
				
				if (posicioAux != i) {
					Puntuacio aux = puntuacions[i];
					puntuacions[i] = puntuacions[posicioAux];
					puntuacions[posicioAux] = aux;
				}
			}
			
			System.out.println("Puntuacions ordenades per punts de manera descendent amb selecció directa:");
			for (int i = 0 ; i < index ; i++) {
				System.out.println(puntuacions[i].toString());
			}
		}else {
			System.out.println("Error! No hi ha cap puntuació registrada!");
		}
	}
	
	public static void ordreCognom() {
		
		if (index > 0) {
			boolean ordenat = true;
			
			do {
				boolean canvi = false;
				
				for (int i = 0 ; i < index ; i++) {
					for (int j = 0 ; j < index - i - 1 ; j++) {
						if (puntuacions[j].getCognom().compareTo(puntuacions[j+1].getCognom()) < 0) {
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
			}while(ordenat != true);
		}else {
			System.out.println("Error! No hi ha cap puntuació registrada!");
		}
	}

}
