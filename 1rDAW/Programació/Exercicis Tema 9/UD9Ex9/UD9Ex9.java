package UD9Ex9;

import java.util.HashSet;
import java.util.Iterator;

public class UD9Ex9 {

	public static void main(String[] args) {
		
		HashSet<Integer> nombres = new HashSet();
		
		//Afegim nombres
		nombres.add(10);
		nombres.add(20);
		nombres.add(30);
		nombres.add(40);
		nombres.add(50);
		
		//Cream l'iterador
		Iterator<Integer> it = nombres.iterator();
		
		//Iteram el HashSet
		System.out.println("Iteram el HashSet...");
		while (it.hasNext()) {
			System.out.print(it.next() + " ");
		}
		
		//Verificar que el 20 i el 35 hi siguin
		System.out.println("\n\nExisteix el nombre 20? = "+nombres.contains(20));
		System.out.println("Existeix el nombre 35? = "+nombres.contains(35));
		
		//Eliminar el nombre 40 i mostrar elements
		nombres.remove(40);
		System.out.println("\nEliminam el 40... "+nombres);
		System.out.println("Correcte, s'ha eliminat!");
		
		//Intentar introduir un nombre que ja existeix i mostrar elements
		nombres.add(50);
		System.out.println("\nIntroduim el 50 repetit... "+nombres);
		System.out.println("Ho accepta però no genera elements duplicats.");
		
		//Obtenir la mida del HashSet
		System.out.println("\nLa mida del HashSet és de "+nombres.size()+" elements.");
		
		//Netejar el HashSet i verificar
		nombres.clear();
		System.out.println("\nNetejam el HashSet... "+nombres);
		System.out.println("Tot el contingut ha quedat eliminat.");

	}

}
