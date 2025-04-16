package Exercicis;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class Ex10_11 {

	static FileWriter pars;
	static FileWriter impars;
	
	public static void main(String[] args) {
		
		int[] nombres =  new int[1000];

		for (int i = 0 ; i < nombres.length ; i++) {
			int n = new Random().nextInt(1000)+1;
			nombres[i] = n;
		}
		
		try {
			pars = new FileWriter("E:\\1rDAW\\Programació\\ExercicisTema10\\Ex11_pars.txt");
			impars = new FileWriter("E:\\1rDAW\\Programació\\ExercicisTema10\\Ex11_impars.txt");
			
			for (int i = 0 ; i < nombres.length ; i++) {
				if(nombres[i] % 2 == 0) {
					pars.write(nombres[i]+" ");
				}else {
					impars.write(nombres[i]+ " ");
				}
			}	
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			try {
				pars.close();
				impars.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
