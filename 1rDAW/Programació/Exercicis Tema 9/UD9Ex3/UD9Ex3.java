package UD9Ex3;

import java.util.ArrayList;

public class UD9Ex3 {

	public static void main(String[] args) {
		
		//1. Crear ArrayList numeros
		ArrayList<Integer> numeros = new ArrayList<Integer>();
		
		//2. Afegir números
		numeros.add(10);
		numeros.add(20);
		numeros.add(30);
		numeros.add(40);
		numeros.add(50);
		
		//3. Imprimir llista original
		System.out.println("Llista original: "+numeros);
		
		//4. Afegim el número 60
		numeros.add(60);
		
		//5. Tornam a imprimir la llista
		System.out.println("\nAfegim el nombre 60...");
		System.out.println(numeros);
		
		//6. Eliminar el número 30
		numeros.remove(2);
		
		//7. Imprimir la llista sense el número 30
		System.out.println("\nEliminam el nombre 30...");
		System.out.println(numeros);
		
		//8. Accedir al primer element i mostrar-lo per pantalla
		System.out.println("\nPrimer element: "+numeros.getFirst());
		
		//9. Modificar el segon element de 20 a 25
		numeros.set(1, 25);
		
		//10. Imprimir la llista amb la modificació
		System.out.println("\nModificam el nombre 20 per el 25...");
		System.out.println(numeros);
		
		//11. Mostra per pantalla la quantitat d'elements
		System.out.println("\nNombre d'elements: "+numeros.size());
		
		//12. Verificar que el nombre 40 hi sigui i imprimir la llista
		boolean trobat = false;
		for (int i = 0 ; i < numeros.size() ; i++) {
			if (numeros.get(i) == 40) {
				System.out.println("\nS'ha trobat el nombre 40! Imprimint la llista...");
				System.out.println(numeros);
				trobat = true;
				}
		}
		
		if (trobat != true) {
			System.out.println("\nNo s'ha trobat el nombre 40...");
			System.out.println("Llista: "+numeros);
		}
		
		//13. Eliminar tots els elements
		System.out.println("\nEliminant tots els elements...");
		numeros.clear();
		
		//14. Verificar que l'ArrayLista està buit i imprimir el resultat
		if (numeros.isEmpty()) {
			System.out.println("\nLa llista és buida: "+numeros);
		}else {
			System.out.println("\nError! La llista encara conté elements: "+numeros);
		}
	}
}
