package Data;

public class Data {
	
	private int dia;
	private int mes;
	private int any;
	
	public void setDia (int dia) {
		do {
			this.dia = dia;
		}while (dia < 1 || dia > 31);
	}
	
	public void setMes (int mes) {
		do {
			this.mes = mes;
		}while (mes < 1 || mes > 12);
	}
	
	public void setAny (int any) {
		this.any = any;
	}
	
	public void mostrarDema() {
		System.out.println("La data següent és "+dia+"-"+mes+"-"+any);
	}

}
