package Exercicis;

import java.util.Scanner;

public class OrdenarArray {
	
	static int[] cadenaNum = null;
	static int[] copia = null;
	static int index = 0;
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---TIPUS D'ORDENACIÓ---");
			System.out.println("1. Ingressa una cadena de nombres.");
			System.out.println("2. Inserció directa.");
			System.out.println("3. Selecció directa.");
			System.out.println("4. Intercanvi directe (bombolla).");
			System.out.println("5. Tancar el programa.");
			System.out.println("Selecciona una opció (1-4):");
			if (sc.hasNextInt() == true) {
				opcio = sc.nextInt();
				sc.nextLine();
			}else {
				System.out.println("Error! Has d'ingressar un nombre enter!");
				sc.nextLine();
			}
			
			switch (opcio) {
			
			case 1:
				generarArray();
				break;
			
			case 2:
				if (cadenaNum == null) {
					System.out.println("Error! Primer has de generar una cadena de nombres.");
				}else {
					//S'executa el tipus d'ordenació
					insercioDirecta();
					//Retornam la cadena al seu estat original per poder utilitzar altres tipus d'ordenació sense haver d'entrar un nou array
					for (int i = 0 ; i < cadenaNum.length ; i++) {
						cadenaNum[i] = copia[i];
					}
				}
				break;
				
			case 3:
				if (cadenaNum == null) {
					System.out.println("Error! Primer has de generar una cadena de nombres.");
				}else {
					seleccioDirecta();
					for (int i = 0 ; i < cadenaNum.length ; i++) {
						cadenaNum[i] = copia[i];
					}
				}
				break;
				
			case 4:
				if (cadenaNum == null) {
					System.out.println("Error! Primer has de generar una cadena de nombres.");
				}else {
					intercanviDirecte();
					for (int i = 0 ; i < cadenaNum.length ; i++) {
						cadenaNum[i] = copia[i];
					}
				}
				break;
				
			case 5:
				System.exit(0);
				break;
				
			default:
				System.out.println("Opció no vàlida!");
			}
			
		}while (opcio != 5);
	}
	
	public static void generarArray() {
		
		int tamany = 0;
		
		//Establim la longitud de l'array
		do {
			System.out.println("Indica la quantitat de nombres que vols afegir:");
			if (sc.hasNextInt()==true) {
				tamany = sc.nextInt();
				sc.nextLine();
			}else {
				System.out.println("Error! Has d'ingressar un nombre enter!");
				sc.nextLine();
			}
		}while(tamany == 0);
		
		cadenaNum = new int[tamany];
		copia = new int[tamany];
		
		//Introduïm els nombres un per un fins que arribem al tamany seleccionat
		do {
			System.out.println("Introdueix el següent nombre de la cadena");
			if (sc.hasNextInt()==true) {
				cadenaNum[index] = sc.nextInt();
				index++;
				sc.nextLine();
			}else {
				System.out.println("Error! Has d'ingressar un nombre enter!");
				sc.nextLine();
			}
		}while(index < tamany);
		
		System.out.println("Cadena completada!"+"\n");
		
		for(int i = 0 ; i < cadenaNum.length ; i++) {
			copia[i] = cadenaNum[i];
		}
		
	}
	
	public static void insercioDirecta() {
		
		boolean ordenat = false;
		
		//Mostram la cadena sense ordenar
		System.out.println("Seqüència original:");
		for(int c = 0 ; c < cadenaNum.length ; c++) {
			System.out.print(cadenaNum[c] + " ");
		}
		System.out.println("\n");
		
		do {
			boolean canvi = false;
			for (int i = 1 ; i < cadenaNum.length ;  i++) {
				//Guardam la posició anterior en una variable auxiliar per poder fer els canvis de posició
				int aux = cadenaNum[i-1];
				if (cadenaNum[i] < cadenaNum[i-1]) {
					cadenaNum[i-1] = cadenaNum[i];
					cadenaNum[i] = aux;
					canvi = true;
				}
			}
			
			//Mentre es detecti algún canvi, direm que no està ordenat i s'ha de seguir executant el bucle
			if (canvi == true) {
				ordenat = false;
			}else {
				ordenat = true;
			}
			
		}while (ordenat == false);
		
		//Mostram la cadena ordenada
		if (ordenat == true) {
			System.out.println("Seqüència ordenada per inserció directa:");
			for (int j = 0 ; j < cadenaNum.length ; j++) {
				System.out.print(cadenaNum[j] + " ");
			}
		}
		System.out.println("\n");
	}
	
	public static void seleccioDirecta() {
		
		int aux;
		int posicioAux;
		
		//Mostram la cadena sense ordenar
		System.out.println("Seqüència original:");
		for(int c = 0 ; c < cadenaNum.length ; c++) {
			System.out.print(cadenaNum[c] + " ");
		}
		System.out.println("\n");
		
		
		for (int i = 0 ; i < cadenaNum.length ; i++) {
			posicioAux = i;
			//Un segon for per trobar on és el nombre més petit
			for (int j = i+1 ; j < cadenaNum.length ; j++) {
				if (cadenaNum[j] < cadenaNum[posicioAux]) {
					posicioAux = j;
				}
			}
			
			//Si el nombre no està a la primera posició (i) voldrà dir que està a (j) i hem de fer un canvi
			if (posicioAux != i) {
				aux = cadenaNum[i];
				cadenaNum[i] = cadenaNum[posicioAux];
				cadenaNum[posicioAux] = aux;
			}
			//Mostram la cadena ordenada
			System.out.print(cadenaNum[i] + " ");
		}
		System.out.println("\n");
	}
	
	public static void intercanviDirecte() {
		
		boolean ordenat = true;
		
		//Mostram la cadena sense ordenar
		System.out.println("Seqüència original:");
		for(int c = 0 ; c < cadenaNum.length ; c++) {
			System.out.print(cadenaNum[c] + " ");
		}
		System.out.println("\n");
		
		do {
			boolean canvi = false;
			for (int i = 0 ; i < cadenaNum.length ; ++i) {
				//La longitud del segon bucle es va escurçant després de cada passada per l'array, ja que el major, ja estarà colocat al final
				for (int j = 0 ; j < cadenaNum.length - i - 1; j++) {
					if (cadenaNum[j] > cadenaNum[j+1]) {
						int aux = cadenaNum[j];
						cadenaNum[j] = cadenaNum[j+1];
						cadenaNum[j+1] = aux;
						canvi = true;
					}
				}
			}
			
			//Mentre es detecti algún canvi, direm que no està ordenat i s'ha de seguir executant el bucle
			if (canvi == true) {
				ordenat = false;
			}else {
				ordenat = true;
			}
			
		}while (ordenat == false);
		
		//Mostram la cadena ordenada
		if (ordenat == true) {
			System.out.println("Seqüència ordenada per intercanvi directe:");
			for (int z = 0 ; z < cadenaNum.length ; z++) {
				System.out.print(cadenaNum[z] + " ");
			}
		}
		System.out.println("\n");
		
	}

}
