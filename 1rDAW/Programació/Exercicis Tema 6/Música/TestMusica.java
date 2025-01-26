package Música;

import java.util.Scanner;

public class TestMusica {
	
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		MP3 m = new MP3();
		Ogg o = new Ogg();
		
		m.definirDurada();
		m.reproduir();
		
		o.definirDurada();
		o.reproduir();

	}

}
