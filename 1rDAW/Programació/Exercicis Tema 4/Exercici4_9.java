package NewPackage;

import java.util.Scanner;

public class Exercici4_9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Quin és el dividend?");
		int dividend = sc.nextInt();
		
		System.out.println("Quinés el divisor?");
		int divisor = sc.nextInt();
		
		int quocient = 0;
		
		while (dividend >= divisor) {
			dividend = dividend - divisor;
			System.out.println("Bucle: per ara el dividend val " + dividend + ".");
			quocient = quocient + 1;
		}
		System.out.println("El resultat final és " + dividend + ".");
		
		System.out.println("El quocient és: " + quocient + ".");
		
		sc.close();

	}

}
