package Exercicis;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Ex10_05 {

	public static void main(String[] args) {
		
		File input = new File("E:\\1rDAW\\Programació\\InventariBotiga.java");
		File output = new File("E:\\1rDAW\\Programació\\InventariBotigaCopia2.java");
		
		int llegit;
		
		FileReader fr = null;
		FileWriter fw = null;
		
		try {
			fr = new FileReader(input);
			fw = new FileWriter(output);
			while((llegit = fr.read())!=-1){
				fw.write(llegit);
				System.out.print((char)llegit);
			};
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fr.close();
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}