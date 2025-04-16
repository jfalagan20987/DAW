package ProjecteFinal;

import java.util.Scanner;

public class GestioCompeticio {
	
	static Jugadors equip1 = (Jugadors) new Equip("Equip 1");
	static Jugadors equip2 = (Jugadors) new Equip("Equip 2");
	
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		int opcio = 0;
		
		do {
			System.out.println("---MENÚ---");
			System.out.println("1. Afegir jugador");
			System.out.println("2. Mostrar plantilla");
			System.out.println("3. Jugar un partit");
			System.out.println("4. Sortir del programa");
			System.out.println("Tria una opció (1-4):");
			opcio = sc.nextInt();
			sc.nextLine();
			
			switch(opcio) {
			
			case 1:
				afegirJugador();
				break;
			
			case 2:
				mostrarPlantilla();
				break;
				
			case 3:
				jugarPartit();
				break;
			
			case 4:
				System.out.println("Sortint del programa...");
				System.exit(0);
				break;
				
			default:
				System.out.println("Opció no vàlida!");
			}
		}while(opcio!=4);

	}
	
	public static void afegirJugador() {
		
		String nomEquip;
		String nomJugador;
		int dorsal;
		String posicio;
		Jugadors jugador;
		int opcio = 0;
		
		System.out.println("A quin equip juga?");
		nomEquip = sc.nextLine();
		
		System.out.println("Introdueix el nom del jugador");
		nomJugador = sc.nextLine();
		
		System.out.println("Introdueix el dorsal:");
		dorsal = sc.nextInt();
		sc.nextLine();
		
		System.out.println("A quina posició juga?");
		posicio = sc.nextLine();
		
		jugador = new Jugadors(nomEquip, nomJugador, dorsal, posicio);
		
		System.out.println("Afegeix el jugador a un equip 3x3 del torneig");
		System.out.println("1. Equip 1");
		System.out.println("2. Equip 2");
		
		switch (opcio) {
		
		case 1:
			equip1.afegirJugador(jugador);
			break;
		
		case 2:
			equip2.afegirJugador(jugador);
			break;
			
		default:
			System.out.println("Opció no vàlida!");
		}
		
	}

}
