package Data;

import java.util.Scanner;

public class Dema {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Data dema = new Data();
		
		System.out.println("Indica la data actual:");
		System.out.println("Dia:");
		dema.setDia(sc.nextInt()+1);
		System.out.println("Mes:");
		dema.setMes(sc.nextInt());
		System.out.println("Any:");
		dema.setAny(sc.nextInt());
		
		dema.mostrarDema();
	}

}
