package Exercicis;

public class VuitReines {
	
	static int totalQueens = 8;
	static int n;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	private void check(int n) {
		
		if(n==totalQueens){
			//imprimir solució;
			return;
		}
		
		for (int i = 0; i < totalQueens; i++) {
			/*ubicar la reina actual (n) a la fila i;
			jutjar si hi ha conflicte i si no n’hi ha crida a check amb una
			reina més;*/
			
			if(judge(n)) {
				check(n+1);
			}
		}
	}

	private boolean judge(int n){
		
		for (int i = 0; i < n; i++) {
			/*if(la posició n està en línea o en la diagonal de i) {
				return false;
			}*/
		}
		return true;
	}

}
