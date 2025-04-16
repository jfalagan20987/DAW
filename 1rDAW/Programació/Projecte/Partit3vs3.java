package Projecte;

import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

//El programa simula una exhibició de basket en un 3vs3 on guanya el primer que arribi a 21 punts
public class Partit3vs3 {
	
	//Definim els dos equips empleant noms simples com 'Vermell' i 'Blau'
	static Plantilla equipVermell = new Plantilla();
	static Plantilla equipBlau = new Plantilla();
	
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		//Llistat de jugadors predefinits
		Jugador shai = new Jugador("OKC Thunder", 31.3, 6.5, 6.3, "Shai Gilgeous-Alexander", 2, "Base");
		Jugador jokic = new Jugador("Denver Nuggets", 30.4, 12.6, 10.1, "Nikola Jokic", 15, "Pivot");
		Jugador doncic = new Jugador("Dallas Mavericks", 34.1, 8.9, 9.4, "Luka Doncic", 77, "Base");
		Jugador giannis = new Jugador("Milwaukee Bucks", 30.8, 12.7, 6.8, "Giannis Antetokounmpo", 34, "Aler");
		Jugador embiid = new Jugador("Philadelphia 76ers", 28.5, 9.8, 3.1, "Joel Embiid", 21, "Pivot");
		Jugador tatum = new Jugador("Boston Celtics", 28.2, 7.4, 5.6, "Jayson Tatum", 0, "Aler");
		
		int opcio = 0;
		
		//MENÚ
		do {
			System.out.println("---PARTIT D'EXHIBICIÓ ALL-STAR 3 VS 3---");
			System.out.println("1. Registra un nou jugador personalitzat.");
			System.out.println("2. Afegeix plantilles predefinides.");
			System.out.println("3. Mostra la plantilla.");
			System.out.println("4. Jugar el partit.");
			System.out.println("5. Sortir del programa.");
			System.out.println("Tria una opció (1-5):");
			if (sc.hasNextInt()==true) {
				opcio = sc.nextInt();
				sc.nextLine();	
			}else {
				System.out.println("Error! Has d'introduir un nombre enter!");
				sc.nextLine();
			}
		
				switch(opcio) {
				
				case 1:
					registrarJugador();
					break;
				
				case 2:
					equipVermell.afegirPredefinit(shai);
					equipVermell.afegirPredefinit(jokic);
					equipVermell.afegirPredefinit(doncic);
					equipBlau.afegirPredefinit(giannis);
					equipBlau.afegirPredefinit(embiid);
					equipBlau.afegirPredefinit(tatum);
					System.out.println("S'han rellenat els equips correctament!"+"\n");
					break;
					
				case 3:
					mostrarPlantilla();
					break;
					
				case 4:
					if (equipVermell.index == 3 && equipBlau.index == 3) {
						jugarPartit();
					}else {
						System.out.println("Els equips no estàn complets! No es pot jugar el partit"+"\n");
					}
					break;
					
				case 5:
					System.out.println("Sortint del programa...");
					System.out.println("Has sortit del programa! Fins la pròxima!");
					System.exit(0);
					break;
					
				default:
					System.out.println("Opció no vàlida!");
				}
			
		}while(opcio!=5);
	}
	
	public static void registrarJugador() {
		
		String nomEquip;
		String nomJugador;
		double pts;
		double reb;
		double ast;
		int dorsal;
		String posicio;
		Jugador jugador;
		int opcio = 0;
		
		System.out.println("DADES DEL JUGADOR");
		System.out.println("Quin és el seu nom?");
		nomJugador = sc.nextLine();
		
		System.out.println("Introdueix el seu equip d'origen:");
		nomEquip = sc.nextLine();
		
		System.out.println("Indica les seves mitjanes durant la temporada:");
		System.out.println("Punts:");
		pts = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Rebots:");
		reb = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Asistencies:");
		ast = sc.nextDouble();
		sc.nextLine();
		
		System.out.println("Indica el seu dorsal:");
		dorsal = sc.nextInt();
		sc.nextLine();
		
		System.out.println("A quina posició juga?");
		posicio = sc.nextLine();
		
		jugador = new Jugador(nomEquip, pts, reb, ast, nomJugador, dorsal, posicio);
		
		System.out.println("Per a quin equip participarà en aquest partit?");
		System.out.println("1. Equip Vermell.");
		System.out.println("2. Equip Blau.");
		System.out.println("Tria una opció (1 o 2):");
		if (sc.hasNextInt()==true) {
			opcio = sc.nextInt();
			sc.nextLine();	
		}else {
			System.out.println("Error! Has d'introduir un nombre enter!");
			sc.nextLine();
		}
		
		switch(opcio) {
		
		case 1:
			equipVermell.afegirJugador(jugador);
			break;
			
		case 2:
			equipBlau.afegirJugador(jugador);
			break;
			
		default:
			System.out.println("Opció no vàlida");
		}
	}
	
	public static void mostrarPlantilla() {
		
		int opcio = 0;
		
		System.out.println("Quina plantilla vols veure?");
		System.out.println("1. Equip Vermell.");
		System.out.println("2. Equip Blau.");
		System.out.println("3. Mostra les dues.");
		System.out.println("Tria una opció (1-3):");
		if (sc.hasNextInt()==true) {
			opcio = sc.nextInt();
			sc.nextLine();	
		}else {
			System.out.println("Error! Has d'introduir un nombre enter!");
			sc.nextLine();
		}
		
		switch(opcio) {
		
		case 1:
			System.out.println("EQUIP VERMELL:");
			System.out.println(equipVermell);
			break;
			
		case 2:
			System.out.println("EQUIP BLAU:");
			System.out.println(equipBlau);
			break;
			
		case 3:
			System.out.println("EQUIP VERMELL:");
			System.out.println(equipVermell);
			System.out.println("\n"+"EQUIP BLAU:");
			System.out.println(equipBlau);
			break;
			
		default:
			System.out.println("Opció no vàlida");
		}
	}
	
	public static void jugarPartit() {
		
		//Possibilitam el fet de que puguin tant encertat com fallar
		Random r = new Random();
		List intent = Arrays.asList("Encert", "Fall");
		
		int puntsVermell = 0;
		int puntsBlau = 0;
		
		int opcio = 0;
		int canasta = 0;
		
		System.out.println("IMPORTANT: Guanya el primer que arribi a 21 punts...");
		System.out.println("COMENÇA EL PARTIT!!!"+"\n");
		
		do {
			System.out.println("Qui llença a cistella?");
			System.out.println("1. Equip Vermell.");
			System.out.println("2. Equip Blau.");
			System.out.println("Tria una opció (1 o 2):");
			if (sc.hasNextInt()==true) {
				opcio = sc.nextInt();
				sc.nextLine();	
			}else {
				System.out.println("Error! Has d'introduir un nombre enter!");
				sc.nextLine();
			}
			
			switch (opcio) {
			
			case 1:
				System.out.println("Tira de dos o tres punts? Indica amb un 2 o un 3:");
				canasta = sc.nextInt();
				if (canasta == 2) {
					int randomitem = r.nextInt(intent.size());
					String randomElement = (String) intent.get(randomitem);
					if(randomElement == "Encert") {
						equipVermell.dosPunts();
					}else {
						equipVermell.fallaDos();
						canasta = 0;
					}
				} else if (canasta == 3) {
					int randomitem = r.nextInt(intent.size());
					String randomElement = (String) intent.get(randomitem);
					if(randomElement == "Encert") {
						equipVermell.tresPunts();
					}else {
						equipVermell.fallaTres();
						canasta = 0;
					}
				} else {
					System.out.println("Opció no vàlida!");
				}
				//El marcador s'actualitza després de cada acció
				puntsVermell += canasta;
				System.out.println("\n"+"---MARCADOR---");
				System.out.println("Equip Vermell: "+puntsVermell);
				System.out.println("Equip Blau: "+puntsBlau +"\n");
				break;
			
			case 2:
				System.out.println("Tira de dos o tres punts? Indica amb un 2 o un 3:");
				canasta = sc.nextInt();
				if (canasta == 2) {
					int randomitem = r.nextInt(intent.size());
					String randomElement = (String) intent.get(randomitem);
					if(randomElement == "Encert") {
						equipBlau.dosPunts();
					}else {
						equipBlau.fallaDos();
						canasta = 0;
					}
				} else if (canasta == 3) {
					int randomitem = r.nextInt(intent.size());
					String randomElement = (String) intent.get(randomitem);
					if(randomElement == "Encert") {
						equipBlau.tresPunts();
					}else {
						equipBlau.fallaTres();
						canasta = 0;
					}
				} else {
					System.out.println("Opció no vàlida!");
				}
				puntsBlau += canasta;
				System.out.println("\n"+"---MARCADOR---");
				System.out.println("Equip Vermell: "+puntsVermell);
				System.out.println("Equip Blau: "+puntsBlau +"\n");
				break;
			
			default:
				System.out.println("Opció no vàlida!");
			}	
		}while(!((puntsVermell >= 21) || (puntsBlau >= 21)));
		
		//Condicions per definir el guanyador
		if (puntsVermell > puntsBlau) {
			System.out.println("\n"+"L'EQUIP VERMELL GUANYA!!!");
			System.out.println("\n"+"---MARCADOR FINAL---");
			System.out.println("Equip Vermell: "+puntsVermell);
			System.out.println("Equip Blau: "+puntsBlau +"\n");
			System.out.println("\n"+"Enhorabona als guanyadors!"+"\n");
			System.out.println("Si vols tornar a jugar, prem el nombre 4!"+"\n");
		} else if (puntsBlau > puntsVermell) {
			System.out.println("\n"+"L'EQUIP BLAU GUANYA!!!");
			System.out.println("\n"+"---MARCADOR FINAL---");
			System.out.println("Equip Vermell: "+puntsVermell);
			System.out.println("Equip Blau: "+puntsBlau +"\n");
			System.out.println("\n"+"Enhorabona als guanyadors!"+"\n");
			System.out.println("Si vols tornar a jugar, prem el nombre 4!"+"\n");
		}
	}

}
