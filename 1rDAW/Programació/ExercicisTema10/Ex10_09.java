package Exercicis;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class Ex10_09 {

	public static void main(String[] args) {

		try {
			RandomAccessFile arxiu = new RandomAccessFile("E:\\1rDAW\\Programació\\ExercicisTema10\\Exercici09.txt", "r");
			arxiu.seek(45);
			char caracter = (char) arxiu.read();
			System.out.println(caracter);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
