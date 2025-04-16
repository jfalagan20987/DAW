package Exercicis;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Ex10_04 {

	public static void main(String[] args) {
		
		File ruta = new File("E:\\1rDAW\\Programació\\InventariBotiga.java");
		File novaRuta = new File("E:\\1rDAW\\Programació\\InventariBotigaCopia.java");
		
		int llegit;
		
		try {
			FileReader in = new FileReader(ruta);
			FileWriter out = new FileWriter(novaRuta);
			copiaDades(in, out);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void copiaDades(FileReader in, FileWriter out) {
		try {
			char[] dades = new char[1000];
			int llegits = 0;
			while (-1 != (llegits = in.read(dades)))
				out.write(dades,0,llegits);
			out.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
