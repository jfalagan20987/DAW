package Examen2024;

public class Lavadora extends Electrodomestico implements enReparacion{
	
	private String marcaLavadora;
	
	public Lavadora(double precio, double consumo, double peso, String marcaLavadora) {
		this.precio = precio;
		this.consumo = consumo;
		this.peso = peso;
		this.marcaLavadora = marcaLavadora;
	}
	
	public Lavadora() {
		
	}
	
	public double getPrecio() {
		return this.precio = precio;
	}
	
	public double getConsumo() {
		return this.consumo = consumo;
	}
	
	public double getPeso() {
		return this.peso = peso;
	}
	
	public String getMarcaLavadora() {
		return this.marcaLavadora = marcaLavadora;
	}
	
	public String toString() {
		String datosLavadora = "";
		return datosLavadora = datosLavadora + "DATOS LAVADORA:" + "\n" + "Precio: " + precio +"\n"+ "Consumo: " + consumo +"\n"+ "Peso: " + peso +"\n"+ "Marca: "+ marcaLavadora +"\n";
	}

	@Override
	public int reparar(int horas) {
		int precioFinal;
		
		precioFinal = horas * PRECIO_HORA;
		return precioFinal;
	}

}
