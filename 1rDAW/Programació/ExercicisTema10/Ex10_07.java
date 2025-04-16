package Exercicis;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ex10_07 {

	public static void main(String[] args) {
		
		int counter = 1;
		
		BufferedReader br;
		try {
			br = new BufferedReader (new FileReader("E:\\1rDAW\\Programació\\ExercicisTema10\\Ex10_01.java"));
			String linia = null;
			
			while (null != (linia = br.readLine())) {
				System.out.println("Linia "+counter+": "+linia);
				counter++;
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
