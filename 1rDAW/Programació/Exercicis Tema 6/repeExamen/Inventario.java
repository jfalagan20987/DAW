package repeExamen;

import java.util.Scanner;

public class Inventario {
	
	static Scanner sc = new Scanner(System.in);
	static int index;
	static Electrodomestico[] electrodomesticos = new Electrodomestico[100];

	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---MENÚ---");
			System.out.println("1. Introducir nuevo dispositivo.");
			System.out.println("2. Mostrar todas las neveras.");
			System.out.println("3. Mostrar todas las lavadoras.");
			System.out.println("4. Mostrar todos los electrodomésticos.");
			System.out.println("5. Número total de electrodomésticos.");
			System.out.println("6. Precio sumado de las neveras.");
			System.out.println("7. Precio sumado de las lavadoras.");
			System.out.println("8. Precio sumado de todos los electrodomésticos.");
			System.out.println("9. Enviar un electrodoméstico a reparar.");
			System.out.println("10. Salir del programa.");
			System.out.println("Introduce una opción:");
			if (sc.hasNextInt() == true) {
				opcio = sc.nextInt();
				sc.nextLine();
			}else {
				System.out.println("¡Error! Debes introducir un número entero.");
			}
			
			switch (opcio) {
			
			case 1:
				registrarDispositivo();
				break;
				
			case 2:
				for (int i = 0 ; i < index ; i++) {
					if (electrodomesticos[i] instanceof Nevera) {
						System.out.println(electrodomesticos[i]);
					}
				}
				break;
				
			case 3:
				for (int i = 0 ; i < index ; i++) {
					if (electrodomesticos[i] instanceof Lavadora) {
						System.out.println(electrodomesticos[i]);
					}
				}
				break;
				
			case 4:
				for (int i = 0 ; i < index ; i++) {
					System.out.println(electrodomesticos[i]);
				}
				break;
				
			case 5:
				System.out.println("El número total de electrodomésticos registrados es de: "+index);
				break;
				
			case 6:
				int precioNeveras = 0;
				for (int i = 0 ; i < index ; i++) {
					if (electrodomesticos[i] instanceof Nevera) {
						precioNeveras += ((Nevera) electrodomesticos[i]).getPrecio();
					}
				}
				System.out.println("El precio sumado de todas las neveras es "+precioNeveras);
				break;
				
			case 7:
				int precioLavadoras = 0;
				for (int i = 0 ; i < index ; i++) {
					if (electrodomesticos[i] instanceof Lavadora) {
						precioLavadoras += ((Lavadora) electrodomesticos[i]).getPrecio();
					}
				}
				System.out.println("El precio sumado de todas las lavadoras es "+precioLavadoras);
				break;
				
			case 8:
				precioTodos();
				break;
			
			case 9:
				necesitaReparar();
				/*int horas;
				horas = sc.nextInt();
				((Nevera)electrodomesticos[0]).reparar(horas);*/
				break;
			
			case 10:
				System.out.println("Saliendo del programa...");
				System.out.println("Has salido con éxito. ¡Hasta la próxima!");
				System.exit(0);
				break;
				
			default:
				System.out.println("Opción no válida.");
			
			}
		}while(opcio!=10);

	}
	
	public static void registrarDispositivo() {
		
		int opcio = 0;
		int precio;
		String marcaNevera;
		String marcaLavadora;
		
		System.out.println("¿Es una nevera o una lavadora?");
		System.out.println("1. Nevera");
		System.out.println("2. Lavadora");
		System.out.println("Seleccione una opción (1 o 2):");
		opcio = sc.nextInt();
		sc.nextLine();
		
		switch (opcio) {
		
		case 1:
			System.out.println("Indique su precio:");
			precio = sc.nextInt();
			sc.nextLine();
			
			System.out.println("Indique la marca de la nevera:");
			marcaNevera = sc.nextLine();
			
			Nevera nevera = new Nevera(precio, marcaNevera);
			
			electrodomesticos[index] = nevera;
			index++;
			break;
			
		case 2:
			System.out.println("Indique su precio:");
			precio = sc.nextInt();
			sc.nextLine();
			
			System.out.println("Indique la marca de la Lavadora:");
			marcaLavadora = sc.nextLine();
			
			Lavadora lavadora = new Lavadora(precio, marcaLavadora);
			
			electrodomesticos[index] = lavadora;
			index++;
			break;
			
		default:
			System.out.println("Opción no válida!!!");
		}
	}
	
	public static void precioTodos() {
		int precioTodos = 0;
		int precioNeveras = 0;
		int precioLavadoras = 0;
		
		
		for (int i = 0 ; i < index ; i++) {
			if (electrodomesticos[i] instanceof Nevera) {
				precioNeveras += ((Nevera) electrodomesticos[i]).getPrecio();
			}
		}
		
		for (int i = 0 ; i < index ; i++) {
			if (electrodomesticos[i] instanceof Lavadora) {
				precioLavadoras += ((Lavadora) electrodomesticos[i]).getPrecio();
			}
		}
		
		precioTodos = precioNeveras + precioLavadoras;
		
		System.out.println("El precio sumado de todos los electrodomésticos es de "+precioTodos+" euros.");
	}
	
	public static void necesitaReparar() {
		
		int opcio = 0;
		String marcaNevera;
		int horas;
		String marcaLavadora;
		
		System.out.println("Quieres reparar una nevera o una lavadora?");
		System.out.println("1. Nevera");
		System.out.println("2. Lavadora");
		System.out.println("Seleccione una opción (1 o 2):");
		opcio = sc.nextInt();
		sc.nextLine();
		
		switch (opcio) {
		
		case 1:
			System.out.println("Indique la marca de la nevera:");
			marcaNevera = sc.nextLine();
			for (int i = 0 ; i < index ; i++) {
				if (electrodomesticos[i] instanceof Nevera) {
					if (marcaNevera.equals(((Nevera) electrodomesticos[i]).getMarcaNevera())) {
						System.out.println("Nevera en reparación!");
						System.out.println("Cuántas horas estará en reparación?");
						horas = sc.nextInt();
						((Nevera) electrodomesticos[i]).reparar(horas);
					}
					else {
						System.out.println("No se ha encontrado la nevera.");
					}
				}
			}
			break;
			
		case 2:
			System.out.println("Indique la marca de la lavadora:");
			marcaLavadora = sc.nextLine();
			for (int i = 0 ; i < index ; i++) {
				if (electrodomesticos[i] instanceof Lavadora) {
					if (marcaLavadora.equals(((Lavadora) electrodomesticos[i]).getMarcaLavadora())) {
						System.out.println("Lavadora en reparación!");
						System.out.println("Cuántas horas estará en reparación?");
						horas = sc.nextInt();
						((Lavadora) electrodomesticos[i]).reparar(horas);
					}
					else {
						System.out.println("No se ha encontrado la lavadora.");
					}
				}
			}
			break;
			
		default:
			System.out.println("Opción no válida!!!");
		}
	}

}
