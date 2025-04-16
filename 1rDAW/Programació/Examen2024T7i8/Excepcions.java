package Examen2024T7i8;

public class Excepcions {
	
	public static void llegirString(String s) throws RuntimeException {
		if (s.isBlank()) {
			throw new RuntimeException("No pots introduir un text en blanc!");
		}
	}
	
	//int punts = Integer.pasrseInt(sc.nextLine()) NumberFormatException
}
