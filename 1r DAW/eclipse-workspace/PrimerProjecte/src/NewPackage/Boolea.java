package NewPackage;

import java.util.Scanner;

public class Boolea {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(58 + 5.5);
		System.out.println(58 - 5.5);
		System.out.println(6 * 25);
		System.out.println(18 / 3);
		System.out.println(27 % 4);
		
		int resultat = 35;
		int m= 5;
		System.out.println(resultat-=m);
		
		System.out.println(true && !(true));
		System.out.println(true || false);
		System.out.println(!false || false);
		
		System.out.println('H'<'J');
		
		System.out.println("Hola" + " Josep");
		
		System.out.println((3+6)*7);
		
		System.out.println('a');
		
		double numero = 40.7;
		System.out.println(numero);
		
		numero--;
		System.out.println(numero);
		
		byte i = (byte)129;
		System.out.println(i);
		
		
		//Taules(arrays)
		int[] nombres = {48, 36, 233, 64, 23, 79};
		System.out.println(nombres[5]);
		
		int[] nombres2 = new int[10];
		nombres2[0] = 25;
		
		int[][] taula = {{2, 3},
						{87, 34},
						{33, 98}
						};
		System.out.println(taula[2][0]);
		System.out.println(nombres[nombres.length-1]);
		
		
		Scanner lector = new Scanner(System.in);
		int nombreLlegit;
		
		String nom = "Josep";
		String cognom = "Falagán";
		System.out.println(nom+"\n"+"\""+cognom+"\"");
		System.out.println(nom.charAt(nom.length()-1));
		System.out.println(nom.toUpperCase());
		
		System.out.println("introdueix un número.");
		nombreLlegit = lector.nextInt();
		System.out.println("El nombre llegit és: " + nombreLlegit);
		System.out.println("introdueix un número.");
		nombreLlegit = lector.nextInt();
		System.out.println("El nombre llegit és: " + nombreLlegit);
		
	}

}