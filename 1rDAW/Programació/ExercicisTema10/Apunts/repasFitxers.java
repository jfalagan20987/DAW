package Apunts;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class repasFitxers {

	public static void main(String[] args) {

		//Fitxers binaris
		try {
			FileInputStream input = new FileInputStream("E:\\1rDAW\\Programació\\IMG_20240926_171750.jpg");
			FileOutputStream output = new FileOutputStream("E:\\1rDAW\\Programació\\IMG_20240926_171750_Copia.jpg");
			int llegit;
			byte[] contingut = new byte[1024];
			while((llegit = input.read(contingut))!=-1) {
				output.write(contingut, 0, llegit);
				System.out.print(" "+llegit);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
