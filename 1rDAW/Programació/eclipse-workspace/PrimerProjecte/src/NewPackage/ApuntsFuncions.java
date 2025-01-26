package NewPackage;

import java.util.Scanner;

//Programa que ordena una llista de nombres i la retorna en ordre descendent
public class ApuntsFuncions {

	private static int[] llistaEnters = new int[10];
	
	//private static int[] llistaEnters; OR llistaEnters = null;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//llegirMida();
		//llistaEnters = new int[mida];
		llegirLlista();
		ordenarLlista();
		mostrarLlista();

	}

	public static void llegirLlista() {
		System.out.println("Escriu 10 valors enters i prem retorn.");
		Scanner lector = new Scanner(System.in);
		int index = 0;
		while (index < llistaEnters.length) {
			if (lector.hasNextInt()) {
				llistaEnters[index] = lector.nextInt();
				index++;
			} else {
				lector.next();
			}
		}
		lector.nextLine();	
	}

	public static void ordenarLlista() {
		for (int i = 0; i < llistaEnters.length - 1; i++) {
			for(int j = i + 1; j < llistaEnters.length; j++) {
				//La posició tractada té un valor més alt que el dela cerca... Els intercanviem.

				if (llistaEnters[i] > llistaEnters[j]) {
					//Per intercanviar valors cal una variable auxiliar

					int canvi = llistaEnters[i];
					llistaEnters[i] = llistaEnters[j];

					llistaEnters[j] = canvi;
				}
			}
		}
	}

	public static void mostrarLlista() {
		System.out.print("L'array ordenat és: [ ");
		for (int i = 0; i < llistaEnters.length;i++) {
			System.out.print(llistaEnters[i] + " ");
		}
		System.out.println("]");
	}

}
