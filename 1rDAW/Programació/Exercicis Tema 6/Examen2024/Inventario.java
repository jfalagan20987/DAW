package Examen2024;

import java.util.Scanner;

public class Inventario{
	
	static Electrodomestico[] electrodomesticos = new Electrodomestico[100];
	static int index;
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		Nevera nevera1 = new Nevera(100.59, 16.5, 78.3, "Samsung");
		electrodomesticos[0] = nevera1;
		
		/*Lavadora lavadora1 = new Lavadora(65.99, 10.1, 72.9, "Philips");
		electrodomesticos[1] = lavadora1;
		
		for (int i = 0 ; i < 2 ; i++) {
			System.out.println(electrodomesticos[i]);
		}*/
		
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
				/*registrarDispositivo();*/
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
				/*numElectrodomesticos();*/
				break;
				
			case 6:
				double precioNeveras = 0;
				for (int i = 0 ; i < index ; i++) {
					if (electrodomesticos[i] instanceof Nevera) {
						precioNeveras += ((Nevera) electrodomesticos[i]).getPrecio();
					}
				}
				System.out.println("El precio sumado de todas las neveras es "+precioNeveras);
				break;
				
			case 7:
				double precioLavadoras = 0;
				for (int i = 0 ; i < index ; i++) {
					if (electrodomesticos[i] instanceof Lavadora) {
						precioLavadoras += ((Lavadora) electrodomesticos[i]).getPrecio();
					}
				}
				System.out.println("El precio sumado de todas las lavadoras es "+precioLavadoras);
				break;
				
			case 8:
				break;
			
			case 9:
				int horas;
				horas = sc.nextInt();
				((Nevera)electrodomesticos[0]).reparar(horas);
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

}
