package Exercicis;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

public class Ex10_06 {

	public static void main(String[] args) {
		
		File ruta = new File("E:\\1rDAW\\ED\\ControlVersions\\HolaMon.java");
		File novaRuta = new File("E:\\1rDAW\\ED\\ControlVersions\\Exercici.gz");

		try {
			GZIPOutputStream out = new GZIPOutputStream(new FileOutputStream(novaRuta));
			FileInputStream in = new FileInputStream(ruta);
			byte[] dades = new byte[1024];
			int llegits = 0;
			while (-1 != (llegits = in.read(dades)))
				out.write(dades,0,llegits);
			in.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
