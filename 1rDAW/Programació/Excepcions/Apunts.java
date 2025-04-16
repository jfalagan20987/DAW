package Excepcions;

import java.io.FileOutputStream;
import java.io.IOException;

public class Apunts {

	public static void main(String[] args) {
		
		int[] nombres = new int[5];
		
		try {
			//System.out.println(7/0);
			System.out.println(nombres[8]);
		}catch(ArithmeticException e) {
			//System.out.println(e.toString());
			//System.out.println(e.getMessage());
			e.printStackTrace();
		}catch(IndexOutOfBoundsException e) {
			System.out.println("T'has sortit de l'array.");
		}finally {
			System.out.println("Sempre sortirà.");
		}
		
		System.out.println("Segueix...");
		

		try {
			llegirFitxer();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		int[] array1 = {1,2,3};
		int[] array2 = {1,2,3,4,5};
		
		try {
			comprovarMida(3, array1);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			comprovarMida(4, array2);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public static void llegirFitxer()throws IOException {
		/*try {
			FileOutputStream f = new FileOutputStream ("C:\\arxiu.txt");
			f.close();
		}catch(Exception e) {
			e.printStackTrace();
		}*/
		
		FileOutputStream f = new FileOutputStream ("C:\\arxiu.txt");
		f.close();
	}
	
	public static void comprovarMida(int i, int[] array) throws IOException {
		if (i != array.length) {
			//throw new RuntimeException("La mida no és la indicada!");
			throw new IOException("La mida no és la indicada!");
		}
	}

}
