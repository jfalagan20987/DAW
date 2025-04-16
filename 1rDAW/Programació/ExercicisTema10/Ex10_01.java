package Exercicis;

import java.io.File;

public class Ex10_01 {

	public static void main(String[] args) {
		
		File directori = new File("E:\\\\1rDAW\\\\Programació");
		
		String[] arxius = directori.list();
		
		for (String nom : arxius) {
			System.out.println(nom);
		}
	}

}
