package NewPackage;

import java.util.Scanner;

public class Exercici4_4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		double nombre1, nombre2, nombre3;
		
		System.out.println("Introdueix tres nombres:");
		nombre1 = sc.nextDouble();
		nombre2 = sc.nextDouble();
		nombre3 = sc.nextDouble();
		
		if ((nombre1 >= nombre2) && (nombre1 >= nombre3)) {
			System.out.println("El nombre més gran és:" + nombre1);
		}else if ((nombre2 >= nombre1) && (nombre2 >= nombre3)) {
			System.out.println("El nombre més gran és:" + nombre2);
		}else {
			System.out.println("El nombre més gran és:" + nombre3);
		}
		
		sc.close();

	}

}
