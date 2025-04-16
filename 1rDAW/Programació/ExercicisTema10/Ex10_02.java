package Exercicis;

import java.io.File;
import java.io.FilenameFilter;

public class Ex10_02 {

	public static void main(String[] args) {
		
		File directori = new File("E:\\1rDAW\\Programació");
		
		String[] arxius = directori.list(new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				if((name.endsWith(".png")||(name.endsWith(".jpg")))){
					return true;
				}else {
					return false;
				}
			}
			
		});
		
		for (String nom : arxius) {
			System.out.println(nom);
		}

	}

}
