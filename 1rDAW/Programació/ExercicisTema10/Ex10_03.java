package Exercicis;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

public class Ex10_03 {

	public static void main(String[] args) {
		
		File input = new File("E:\\1rDAW\\Programació\\ExamenUD1-2-3.pdf");
		File output = new File("E:\\1rDAW\\Programació\\ExamenUD1-2-3-Copia.pdf");
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		byte[] dades = null;
		ByteArrayOutputStream cos = null;
		
		int llegit = 0;
		
		try {
			fis = new FileInputStream(input);
			System.out.println("Bytes al fitxer original: "+fis.available()); //Aquesta funció retorna els bytes pendents de ser llegits
			fos = new FileOutputStream(output);
			cos = new ByteArrayOutputStream();
			while((llegit = fis.read())!=-1){
				fos.write(llegit);
				cos.write(llegit);
			};
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		dades = cos.toByteArray();
		
		//Entenc que la mida de l'original i de la copia ha de ser la mateixa
		//Però no tenc clar com trobar aquestes dades
		
		/*System.out.println(output.length());
		System.out.println(dades.length);
		System.out.println(llegit);*/
	}
}
