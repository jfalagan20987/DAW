package Excepcions;

public class Excepcions {
	
	public static void comprovarMida(int i, char[] frase) throws IndexOutOfBoundsException{
		if (i > frase.length) {
			throw new IndexOutOfBoundsException ("La mida no és la indicada!");
		}else {
			System.out.println("Continúa amb el bucle...");
		}
	}
}
