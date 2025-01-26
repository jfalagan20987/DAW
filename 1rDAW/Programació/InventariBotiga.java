package NewPackage;

import java.util.Scanner;

public class InventariBotiga {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner lector = new Scanner(System.in);
		
		String[][]inventari = new String[3][3];
		
		System.out.println("Introdueix la informació per al producte 1:");
		System.out.print("Nom del producte: ");
		inventari[0][0] = lector.next();
		System.out.print("Quantitat en estoc: ");
		inventari[0][1] = lector.next();
		System.out.print("Preu per unitat: ");
		inventari[0][2] = lector.next();
		
		System.out.println("Introdueix la informació per al producte 2:");
		System.out.print("Nom del producte: ");
		inventari[1][0] = lector.next();
		System.out.print("Quantitat en estoc: ");
		inventari[1][1] = lector.next();
		System.out.print("Preu per unitat: ");
		inventari[1][2] = lector.next();
		
		System.out.println("Introdueix la informació per al producte 3:");
		System.out.print("Nom del producte: ");
		inventari[2][0] = lector.next();
		System.out.print("Quantitat en estoc: ");
		inventari[2][1] = lector.next();
		System.out.print("Preu per unitat: ");
		inventari[2][2] = lector.next();
		
		System.out.println("\nInventari de la botiga:");
		System.out.println("Nom\t\tQuant.\tPreu\tTotal");
		int quantitat = Integer.parseInt(inventari[0][1]);
		double preu = Double.parseDouble(inventari[0][2]);
		System.out.println(inventari[0][0]+"\t"+"\t"+quantitat+"\t"+preu+"\t"+(quantitat*preu));
		
		int quantitat2 = Integer.parseInt(inventari[1][1]);
		double preu2 = Double.parseDouble(inventari[1][2]);
		System.out.println(inventari[1][0]+"\t"+"\t"+quantitat2+"\t"+preu2+"\t"+(quantitat2*preu2));
		
		int quantitat3 = Integer.parseInt(inventari[2][1]);
		double preu3 = Double.parseDouble(inventari[2][2]);
		System.out.println(inventari[2][0]+"\t"+quantitat3+"\t"+preu3+"\t"+(quantitat3*preu3));
		
		System.out.print("\nValor total de l'inventari: ");
		System.out.println((quantitat*preu)+(quantitat2*preu2)+(quantitat3*preu3));

	}

}
