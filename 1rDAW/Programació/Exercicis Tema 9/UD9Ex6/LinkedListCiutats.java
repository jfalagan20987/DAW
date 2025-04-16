package UD9Ex6;

import java.util.LinkedList;

public class LinkedListCiutats {

	public static void main(String[] args) {
		
		//1. Cream la LinkedList de ciutats
		LinkedList<String> ciutats = new LinkedList<String>();
		
		//2. Afegim Barcelona, Madrid, València i Sevilla
		ciutats.add("Barcelona");
		ciutats.add("Madrid");
		ciutats.add("València");
		ciutats.add("Sevilla");
		
		//3. Mostrar la llista original
		System.out.println("Llista original: "+ciutats);
		
		//4. Afegir la ciutat Bilbao al principi
		ciutats.addFirst("Bilbao");
		
		//5. Afegir Màlaga al final
		ciutats.addLast("Màlaga");
		
		//6. Mostrar el primer i el darrer element
		System.out.println("\nPrimer element: "+ciutats.peekFirst());
		System.out.println("Darrer element: "+ciutats.peekLast());
		//ciutats.getFirst();
		//ciutats.getLast();
		
		//7. Eliminar la primera ciutat
		System.out.println("\nEliminam la primera ciutat...");
		ciutats.pollFirst();
		//ciutats.removeFirst();
		
		//8. Eliminar la darrera ciutat
		System.out.println("Eliminam la darrera ciutat...");
		ciutats.pollLast();
		//ciutats.removeLast();
		
		//9. Mostram la llista després de les modificacions
		System.out.println("\nLlista: "+ciutats);
		
	}

}
