package NewPackage;

import java.util.Scanner;

public class Exercici4_25 {
	
	static Scanner sc = new Scanner(System.in);
	static String num;
	static int max = 0;
	static int min;
	static int posMax = 0;
	static int posMin = 0;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		llegirNombre();
		cercarMaxim();
		cercarMinim();
		
		System.out.println("El dígit més gran de "+num+" és "+(char)max+" i és troba a la "+posMax+"a posició.");
		System.out.println("Y el dígit més menor és "+(char)min+" i és troba a la "+posMin+"a posició.");

	}
	
	public static void llegirNombre() {
		
		do {
			System.out.println("Entra un nombre enter de màxim 15 xifres:");
			num = sc.nextLine();
		}while (num.length() > 15);
	}
	
	public static int cercarMaxim() {
		
		for (int i = 0 ; i < num.length() ; i++) {
			if (num.charAt(i) >= max) {
				max = num.charAt(i);
				posMax = i + 1;
			}
		}
		return max;
	}
	
	public static int cercarMinim() {
		
		min = num.charAt(0);
		
		for (int i = 0 ; i < num.length() ; i++) {
			if (num.charAt(i) <= min) {
				min = num.charAt(i);
				posMin = i + 1;
			}
		}
		return min;
	}
	
}
