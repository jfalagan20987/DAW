package NewPackage;

import java.util.Scanner;

public class Exercici4_5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		double nombre1, nombre2, nombre3;
		
		System.out.println("Introdueix tres nombres:");
		nombre1 = sc.nextDouble();
		nombre2 = sc.nextDouble();
		nombre3 = sc.nextDouble();
		
		if ((nombre1 >= nombre2) && (nombre1 >= nombre3) && (nombre2 >= nombre3)) {
			System.out.println("L'ordre de més gran a més petit és:" +nombre1+", "+nombre2+", "+nombre3);
		}else if ((nombre1 >= nombre2) && (nombre1 >= nombre3) && (nombre3 >= nombre2)) {
			System.out.println("L'ordre de més gran a més petit és:" +nombre1+", "+nombre3+", "+nombre2);
		}else if ((nombre2 >= nombre1) && (nombre2 >= nombre3) && (nombre1 >= nombre3)) {
			System.out.println("L'ordre de més gran a més petit és:" +nombre2+", " +nombre1+", "+nombre3);
		}else if ((nombre2 >= nombre1) && (nombre2 >= nombre3) && (nombre3 >= nombre1)) {
			System.out.println("L'ordre de més gran a més petit és:" +nombre2+", "+nombre3+", "+nombre1);
		}else if ((nombre3 >= nombre1) && (nombre3 >= nombre2) && (nombre1 >= nombre2)) {
			System.out.println("L'ordre de més gran a més petit és:" +nombre3+", "+nombre1+", "+nombre2);
		}else {
			System.out.println("L'ordre de més gran a més petit és:" +nombre3+", "+nombre2+", "+nombre1);
		}
		sc.close();

	}

}
