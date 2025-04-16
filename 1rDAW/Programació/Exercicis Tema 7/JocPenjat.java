package Exercicis;

import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class JocPenjat {
	
	static Random r = new Random();
	static Scanner sc = new Scanner(System.in);
	static String[][] dibuix = {
			{"  -- \n"}, 
			{" /  | \n"}, 
			{"|   O \n"},
			{"|  -|-\n"}, 
			{"|   | \n"}, 
			{"|  / \\\n"}, 
			{"| HAS PERDUT!\n"}};
	//String que guardarà la paraula aleatoria
	static String randomElement;

	public static void main(String[] args) {
		
		//Opcions a endevinar
		String[] paraules = {"cavall", "granja", "tractor", "agricultura", "ramaderia", "verdura", "vaca", "llet", "gallina", "ovella", "fruita", "cereal", "hectarea", "pastor", "cabra", "posada"};

		int opcio = 0;
		
		//MENÚ
		do {
			System.out.println("---MENÚ---");
			System.out.println("1. Genera una nova paraula.");
			System.out.println("2. Jugar.");
			System.out.println("3. Rendirse.");
			System.out.println("4. Sortir del programa.");
			if (sc.hasNextInt() == true) {
				opcio = sc.nextInt();
				sc.nextLine();
			}else {
				System.out.println("Error! Has d'entrar un nombre enter!");
				sc.nextLine();
			}
			
			switch (opcio) {
			
			//Generam una paraula aleatoria
			case 1:
				int r = new Random().nextInt(paraules.length);
				randomElement = (paraules[r]);
				System.out.println("S'ha generat una nova paraula!"+"\n");
				break;
				
			case 2:
				if (randomElement == null) {
					System.out.println("Error! Primer has de generar una paraula!");
				} else {
					jugar();
				}
				break;
				
			case 3:
				//Si després de jugar i perdre, podrem tornar al menú per poder veure la sol·lució
				if (randomElement == null) {
					System.out.println("Error! Primer has de generar una paraula!");
				} else {
					System.out.println("La paraula era "+randomElement+"!");
					System.exit(0);
				}
				break;
				
			case 4:
				System.out.println("Sortint del programa...");
				System.out.println("Has sortit amb èxit! Fins la pròxima!");
				System.exit(0);
				break;
				
			default:
				System.out.println("Opció no vàlida!");
			}
			
		}while(opcio != 4);

	}
	
	public static void jugar() {
		
		int intentsMax = 0;
		
		//Variable que guarda cada lletra que intenta esbrinar l'usuari
		char lletra;
		
		//Traslladam el String que conté la paraula a un array de caràcters
		char[] copiaParaula = randomElement.toCharArray();
		
		//Array on guardam les lletres errades
		char[] falls = new char[20];
		int index = 0;
		
		//Caràcter que substitueix inicialment totes les posicions de l'array de caràcters amb la paraula
		char guio = '_';
		
		//Substituïm tot l'array de caràcters per guions
		System.out.println("\n"+"Intenta esbrinar la paraula"+"\n");
		for (int i = 0 ; i < copiaParaula.length ; i++) {
			copiaParaula[i] = guio;
			System.out.print(copiaParaula[i]+" ");
		}
		
		//Bucle que es genera fins guanyar o perdre
		do{
			boolean coincideix = false;
			System.out.println("\n"+"Introdueix una lletra:"+"\n");
			lletra = sc.next().charAt(0);
			for (int j = 0 ; j < copiaParaula.length ; j++) {
				if (lletra == randomElement.charAt(j)) {
					coincideix = true;
					copiaParaula[j] = lletra;
				}
			System.out.print(copiaParaula[j] + " ");
			}
			System.out.println("\n");
			
			if (coincideix == false) {
				intentsMax++;
				falls[index] = lletra;
				index++;
				System.out.print("Lletres errades: ");
				System.out.println(falls);
			}
			if ((intentsMax > 0)) {
				for (int i = 1 ; i <= intentsMax ; i++) {
					System.out.println(dibuix[i-1][0]);
				}
			}
			
			//Comprovant per veure si l'usuari ha encertat tota la paraula
			boolean resolt = true;
			for (int z = 0 ; z < copiaParaula.length ; z++) {
				if (copiaParaula[z] == '_') {
					resolt = false;
				}
			}
			if(resolt == true) {
				System.out.println("Enhorabona, has guanyat!"+"\n"+"Fins la pròxima!");
				System.exit(0);
			}
		}while (intentsMax != 7);
		
	}
}