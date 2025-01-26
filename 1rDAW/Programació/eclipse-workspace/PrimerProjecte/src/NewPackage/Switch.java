package NewPackage;

import java.util.Scanner;

public class Switch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		double num1=0, num2=0;
		int opcio=0;
		
		System.out.println("---MENU---");
		System.out.println("1.- Suma");
		System.out.println("2.- Resta");
		System.out.println("3.- Multiplicació");
		System.out.println("4.- Divisió");
		System.out.println("Introdueixi dos numeros");
		
		if (sc.hasNextDouble()==true) {
			num1 = sc.nextDouble();
		}
		else {
			System.out.println("Tipus de dada introduit és incorrecte!");
		}
		
		if (sc.hasNextDouble()==true) {
			num2 = sc.nextDouble();
		}
		else {
			System.out.println("Tipus de dada introduit és incorrecte!");
		}
		
		System.out.println("Introdueixi la operació (1-4)");
		
		if (sc.hasNextInt()==true) {
			opcio = sc.nextInt();
		}
		else {
			System.out.println("Tipus de dada introduit és incorrecte!");
		}
		
		switch (opcio) {
		
		case 1 :
			System.out.println("La suma és: " + (num1+num2));
			break;
		
		case 2 :
			System.out.println("La resta és: " + (num1-num2));
			break;
		
		case 3 :
			System.out.println("La multiplicació és: " + (num1*num2));
			break;
			
		case 4 :
			System.out.println("La divisió és: " + (num1/num2));
			break;
			
		default :
			System.out.println("Opció incorrecta");
		}
		
		sc.close();

	}

}
