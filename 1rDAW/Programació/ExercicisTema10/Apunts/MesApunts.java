package Apunts;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;

public class MesApunts {

	public static void main(String[] args) {
		File input = new File("E:\\1rDAW\\Programació\\TipusOrdenacio.java");
		//File output = new File("E:\\1rDAW\\Programació\\TipusOrdenacioCopia.java");
		byte[] output = null;
		FileInputStream fis = null;
		//FileOutputStream fos = null;
		ByteArrayOutputStream cos = null;
		int llegit;
		
		try {
			fis = new FileInputStream(input);
			cos = new ByteArrayOutputStream();
			while((llegit = fis.read())!=-1){
				cos.write(llegit);
			};
			
			output = cos.toByteArray();
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(Arrays.toString(output));
	}

}
