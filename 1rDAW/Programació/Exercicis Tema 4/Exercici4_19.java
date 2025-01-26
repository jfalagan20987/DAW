package NewPackage;

import java.util.Scanner;

public class Exercici4_19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Introdueix un nombre enter:");
		int num = sc.nextInt();
		
		boolean primer = true;
		
		for (int divisor = 2 ; divisor < num ; divisor++) {
			if (num%divisor == 0) {
				primer = false;
				break;
			}
		}
		if (primer == true) {
			System.out.println("El nombre "+num+" és primer!");
		}else {
			System.out.println("El nombre "+num+" no és primer!");
		}
		
		sc.close();

	}

}
