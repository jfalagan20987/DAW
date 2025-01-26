package Password;

import java.util.Random;

public class Password {
	
	private String password;
	private int longitud;
	
	public Password() {
		
		String text = "";
		longitud = 8;
		
		for (int i = 0 ; i < longitud ; i++) {
			text = text + random();
		}
		
		password = text;
	}
	
	public Password(int longitud) {
		
		String text = "";
		this.longitud = longitud;
		for (int i = 0 ; i < longitud ; i++) {
			text = text + random();
		}
		
		password = text;
	}
	
	public boolean esRobust() {
		boolean esRobust = false;
		char caracter;
		
		for (int i = 0 ; i<password.length() ; i++) {
			caracter = password.charAt(i);
			
			if (Character.isDigit(caracter)) {
				esRobust = true;
				break;
			}
			
			if (Character.isUpperCase(caracter)) {
				esRobust = true;
				break;
			}
			
			if (Character.isLowerCase(caracter)) {
				esRobust = true;
				break;
			}
			
			if (password.contains("$") == true) {
				esRobust = true;
				break;
			}
			
			if (password.contains("?")== true) {
				esRobust = true;
				break;
			}
			
			if (password.contains("¿") == true) {
				esRobust = true;
			}
			
			if (password.contains("!") == true) {
				esRobust = true;
			}
			
			if (password.contains("¡") == true) {
				esRobust = true;
			}
			
			if (password.contains("&") == true) {
				esRobust = true;
			}
			
			if (password.contains("%") == true) {
				esRobust = true;
			}
			
			if (password.contains("*") == true) {
				esRobust = true;
			}
			
			if (password.contains("/") == true) {
				esRobust = true;
			}
			
			if (password.contains("+") == true) {
				esRobust = true;
			}
			
			if (password.contains("-") == true) {
				esRobust = true;
			}
		}
		
		if (esRobust == true) {
			return true;
		}else {
			return false;
		}
	}
	
	public void mostrarDades(boolean esRobust) {
		if (esRobust) {
			System.out.println("La contrasenya "+password+" és robusta.");
		}else {
			System.out.println("La contrasenya "+password+" no és robusta.");
		}
	}
	
	public static String random() {

		Random random = new Random();

		int randomNum = 0 + random.nextInt(70);

		String caracter = "";

		switch (randomNum) {
		case 0:
			caracter = "A";
			break;
		case 1:
			caracter = "B";
			break;
		case 2:
			caracter = "C";
			break;
		case 3:
			caracter = "D";
			break;
		case 4:
			caracter = "E";
			break;
		case 5:
			caracter = "F";
			break;
		case 6:
			caracter = "G";
			break;
		case 7:
			caracter = "H";
			break;
		case 8:
			caracter = "I";
			break;
		case 9:
			caracter = "J";
			break;
		case 10:
			caracter = "K";
			break;
		case 11:
			caracter = "L";
			break;
		case 12:
			caracter = "M";
			break;
		case 13:
			caracter = "N";
			break;
		case 14:
			caracter = "O";
			break;
		case 15:
			caracter = "P";
			break;
		case 16:
			caracter = "Q";
			break;
		case 17:
			caracter = "R";
			break;
		case 18:
			caracter = "S";
			break;
		case 19:
			caracter = "T";
			break;
		case 20:
			caracter = "U";
			break;
		case 21:
			caracter = "V";
			break;
		case 22:
			caracter = "W";
			break;
		case 23:
			caracter = "X";
			break;
		case 24:
			caracter = "Y";
			break;
		case 25:
			caracter = "Z";
			break;
		case 26:
			caracter = "a";
			break;
		case 27:
			caracter = "b";
			break;
		case 28:
			caracter = "c";
			break;
		case 29:
			caracter = "d";
			break;
		case 30:
			caracter = "e";
			break;
		case 31:
			caracter = "f";
			break;
		case 32:
			caracter = "g";
			break;
		case 33:
			caracter = "h";
			break;
		case 34:
			caracter = "i";
			break;
		case 35:
			caracter = "j";
			break;
		case 36:
			caracter = "k";
			break;
		case 37:
			caracter = "l";
			break;
		case 38:
			caracter = "m";
			break;
		case 39:
			caracter = "n";
			break;
		case 40:
			caracter = "o";
			break;
		case 41:
			caracter = "p";
			break;
		case 42:
			caracter = "q";
			break;
		case 43:
			caracter = "r";
			break;
		case 44:
			caracter = "s";
			break;
		case 45:
			caracter = "t";
			break;
		case 46:
			caracter = "u";
			break;
		case 47:
			caracter = "v";
			break;
		case 48:
			caracter = "w";
			break;
		case 49:
			caracter = "x";
			break;
		case 50:
			caracter = "y";
			break;
		case 51:
			caracter = "z";
			break;
		case 52:
			caracter = "0";
			break;
		case 53:
			caracter = "1";
			break;
		case 54:
			caracter = "2";
			break;
		case 55:
			caracter = "3";
			break;
		case 56:
			caracter = "4";
			break;
		case 57:
			caracter = "5";
			break;
		case 58:
			caracter = "6";
			break;
		case 59:
			caracter = "7";
			break;
		case 60:
			caracter = "8";
			break;
		case 61:
			caracter = "9";
			break;
		case 62:
			caracter = "?";
			break;
		case 63:
			caracter = "¿";
			break;
		case 64:
			caracter = "!";
			break;
		case 65:
			caracter = "¡";
			break;
		case 66:
			caracter = "#";
			break;
		case 67:
			caracter = "$";
			break;
		case 68:
			caracter = "%";
			break;
		case 69:
			caracter = "/";
			break;
		case 70:
			caracter = "+";
			break;
		case 71:
			caracter = "-";
			break;
		case 72:
			caracter = "*";
		default:
			System.out.println("Error");;
			break;
		}
		return caracter;

	}

}
