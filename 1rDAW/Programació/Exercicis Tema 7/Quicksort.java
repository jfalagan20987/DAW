package Exercicis;

import java.util.Scanner;

public class Quicksort {

	static int[] cadenaNum = null;
	static int[] copia = null;
	static int index = 0;
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("SISTEMA D'ORDENACIÓ RÀPIDA (QUICKSORT)");
			System.out.println("1. Genera una nova cadena de nombres.");
			System.out.println("2. Quicksort (ordenació ràpida).");
			System.out.println("3. Tanca el programa.");
			System.out.println("Tria una opció (1-3):");
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
					System.out.println("Seqüència original:");
					for(int i = 0 ; i < cadenaNum.length ; i++) {
						System.out.print(cadenaNum[i] + " ");
					}
					System.out.println("\n");
					ordenacioRapida(0, cadenaNum.length-1);
					System.out.println("Seqüència ordenada per ordenació ràpida (Quicksort):");
					for (int j = 0 ; j < cadenaNum.length ; j++) {
						System.out.print(cadenaNum[j] + " ");
					}
					System.out.println("\n");
					
					for (int z = 0 ; z < cadenaNum.length ; z++) {
						cadenaNum[z] = copia[z];
					}
				}
				break;
			
			case 3:
				System.exit(opcio);
				break;
				
			default:
				System.out.println("Opció no vàlida!");
			}

		}while(opcio !=3);
	}
	
	public static void generarArray() {
		
		int tamany = 0;

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
	
	public static void ordenacioRapida(int leftIndex, int rightIndex) {
		
		int aux;
		int pivot;
		
		if (leftIndex < rightIndex) {
			pivot = cadenaNum[rightIndex];
			int indexAux = leftIndex-1;
			for (int i = leftIndex ; i < cadenaNum.length ; i++) {
				if (cadenaNum[i] <= pivot) {
					indexAux++;
					aux = cadenaNum[indexAux];
					cadenaNum[indexAux] = cadenaNum[i];
					cadenaNum[i] = aux;
				}
			}
			
			
			ordenacioRapida(leftIndex+1, rightIndex);
			ordenacioRapida(leftIndex, rightIndex-1);
		}
		
		/*if (leftIndex < rightIndex) {
			for (int left = leftIndex ; left <= pivot ; left++) {
				for (int right = rightIndex ; right >= pivot ; right--) {
					if ((cadenaNum[left] > cadenaNum[pivot])&&(cadenaNum[right] < cadenaNum[pivot])) {
						aux = cadenaNum[left];
						cadenaNum[left] = cadenaNum[right];
						cadenaNum[right] = aux;
					}
				}
			}
			leftIndex++;
			rightIndex--;
			pivot--;
		}*/

	}
}
