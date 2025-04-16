package Apunts;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;

public class Apunts {

	public static void main(String[] args) {
		
		//File f = new File("E:\\1rDAW\\Programació");

		//System.out.println(f.exists());
		//System.out.println(f.isDirectory());
		
		/*if (!f.exists()) {
			try {
				f.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}*/
		
		//String[] llistat = f.list();
		
		/*String[] llistat = f.list(new FilenameFilter () {

			@Override
			public boolean accept(File dir, String name) {
				if (name.endsWith(".java")) {
					return true;
				}else {
					return false;
				}
			}
			
		});
		
		for(String nom : llistat) {
			System.out.println(nom);
		}*/
		
		File input = new File("E:\\1rDAW\\Programació\\TipusOrdenacio.java");
		File output = new File("E:\\1rDAW\\Programació\\TipusOrdenacioCopia.java");
		FileInputStream fis = null;
		FileOutputStream fos = null;
		int llegit;
		
		try {
			fis = new FileInputStream(input);
			fos = new FileOutputStream(output);
			while((llegit = fis.read())!=-1){
				fos.write(llegit);
			};
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
