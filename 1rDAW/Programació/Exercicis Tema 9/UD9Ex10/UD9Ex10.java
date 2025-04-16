package UD9Ex10;

import java.util.Iterator;
import java.util.TreeSet;

public class UD9Ex10 {

	public static void main(String[] args) {
		
		TreeSet<String> animals = new TreeSet();
		
		//Afegim animals
		animals.add("Lleó");
		animals.add("Cocodril");
		animals.add("Ornitorrinc");
		animals.add("Zebra");
		animals.add("Cavall");
		
		//Cream l'iterador
		Iterator<String> it = animals.iterator();
		
		//Iteram el TreeSet
		System.out.println("Iteram el TreeSet...");
		while(it.hasNext()) {
			System.out.println(it.next() + " ");
		}
		System.out.println("S'ha ordenat alfabèticament!");
		
		//Verificar que una cadena de text estigui present
		System.out.println("\nEstà Lleó a la llista? = "+animals.contains("Lleó"));
		System.out.println("Està Elefant a la llista? = "+animals.contains("Elefant"));
		
		//Intentar afegir un element ja existent
		animals.add("Ornitorrinc");
		System.out.println("\nIntentam afegir l'Ortnitorrinc un altre cop...");
		System.out.println(animals);
		System.out.println("No dóna error però no duplica l'element.");
		
		//Eliminar una cadena de text
		animals.remove("Zebra");
		System.out.println("\nEl Lleó s'ha menjat la Zebra...");
		System.out.println(animals);
		System.out.println("La Zebra ha sigut eliminada de la llista.");
		
	}

}
