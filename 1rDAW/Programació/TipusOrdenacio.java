package Exercicis;

public class TipusOrdenacio {
	
	static final int MAX_LONGITUD = 100;
	static int[] array = new int[MAX_LONGITUD];
	static int index = 0;
	
	public static void main(String[] args) {

	}
	
	public static void insercioDirecta() {
		
		boolean ordenat = false;
		
		if (index > 0) {
			do {
				boolean canvi = false;
				for (int i = 1 ; i < index ; i++) {
					int aux = array[i-1];
					if(array[i] < array[i-1]) {
						array[i-1] = array[i];
						array[i] = aux;
						canvi = true;
					}
				}
				
				if (canvi == true) {
					ordenat = false;
				}else {
					ordenat = true;
				}
			}while(ordenat != true);
			
			for (int i = 0; i < index ; i++) {
				System.out.println(array[i]);
			}
		}else {
			System.out.println("No hi ha cap entrada registrada!");
		}
	}
	
	public static void seleccioDirecta() {
		
		if (index > 0) {
			for (int i = 0 ; i < index ; i++) {
				int posicioAux = i;
				for (int j = i+1 ; j < index ; j++) {
					if (array[j] < array[posicioAux]) {
						posicioAux = j;
					}
				}
				
				if (posicioAux != i) {
					int aux = array[i];
					array[i] = array[posicioAux];
					array[posicioAux] = aux;
				}
			}
			
			for (int i = 0; i < index ; i++) {
				System.out.println(array[i]);
			}
		}else {
			System.out.println("No hi ha cap entrada registrada!");
		}
		
	}
	
	public static void intercanviDirecteBombolla() {
		
		boolean ordenat = false;
		
		if (index > 0) {
			do {
				boolean canvi = false;
				
				for (int i = 0 ; i < index ; i++) {
					for (int j = 0 ; j < index - i - 1 ; j++) {
						if (array[j] > array[j+1]) {
							int aux = array[j];
							array[j] = array[j+1];
							array[j+1] = aux;
							canvi = true;
						}
					}
					
					if (canvi == true) {
						ordenat = false;
					}else {
						ordenat = true;
					}
				}
			}while(ordenat != true);
			
			for (int i = 0; i < index ; i++) {
				System.out.println(array[i]);
			}
			
		}else {
			System.out.println("No hi ha cap entrada registrada!");
		}
	}
	
	public static void quicksort(int leftIndex, int rightIndex) {
		
		if (index > 0) {
			if (leftIndex < rightIndex) {
				int pivot = array[rightIndex];
				int posicioAux = leftIndex-1;
				for(int i = leftIndex ; i < index ; i++) {
					if (array[i] <= pivot) {
						posicioAux++;
						int aux = array[posicioAux];
						array[posicioAux] = array[i];
						array[i] = aux;
					}
				}
			}
			
			quicksort(leftIndex+1, rightIndex);
			quicksort(leftIndex, rightIndex-1);
		}else {
			System.out.println("No hi ha cap entrada registrada!");
		}
	}

}
