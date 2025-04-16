package Exercicis;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class Ex10_10 {

	public static void main(String[] args) {

		try {
			URL url = new URL("https://www.nba.com/");
			
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			
			FileWriter inputText = new FileWriter("E:\\1rDAW\\Programació\\ExercicisTema10\\nba.html");
			int llegits = 0;
			char[] dades = new char[100];
			while (-1 != (llegits = in.read(dades))) {
				inputText.write(dades,0,llegits);
			}
			inputText.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
