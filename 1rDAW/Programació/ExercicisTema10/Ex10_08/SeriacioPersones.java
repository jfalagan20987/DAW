package Ex10_08;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

public class SeriacioPersones {

	public static void main(String[] args) {
		
		//GUARDAR ARRAYLIST
		
		//Generam l'ArrayList
		ArrayList<Persona> persones = new ArrayList();
		
		/*
		//Introduïm dades
		persones.add(new Profesor("Alex Caruso", "41547896D", 31, "Defense"));
		persones.add(new Alumne("Cason Wallace", "41578965C", 21, "A+"));
		
		//Escritura d'aquestes dades a un fitxer
		try {
			FileOutputStream fos = new FileOutputStream("E:\\1rDAW\\Programació\\ExercicisTema10\\Ex10_08\\persones.dat");
			ObjectOutputStream input = new ObjectOutputStream(fos);
			input.writeObject(persones);
			
			for (Persona i : persones) {
				System.out.println(i);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		
		//RECUPERAR ARRAYLIST
		
		//Lectura de dades
		try {
			FileInputStream fis = new FileInputStream("E:\\1rDAW\\Programació\\ExercicisTema10\\Ex10_08\\persones.dat");
			ObjectInputStream input = new ObjectInputStream(fis);
			persones = (ArrayList<Persona>)input.readObject();
			
			for (Persona i : persones) {
				System.out.println(i);
			}
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
