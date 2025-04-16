package Examen2024;

public class Nevera extends Electrodomestico implements enReparacion{
	
	private String marcaNevera;
	
	public Nevera(double precio, double consumo, double peso, String marcaNevera) {
		this.precio = precio;
		this.consumo = consumo;
		this.peso = peso;
		this.marcaNevera = marcaNevera;
	}
	
	public Nevera() {
		
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
	
	public String getMarcaNevera() {
		return this.marcaNevera = marcaNevera;
	}
	
	public String toString() {
		String datosNevera = "";
		return datosNevera = datosNevera + "DATOS NEVERA:" + "\n" + "Precio: " + precio +"\n"+ "Consumo: " + consumo +"\n"+ "Peso: " + peso +"\n"+ "Marca: "+ marcaNevera +"\n";
	}
	
	@Override
	public int reparar(int horas) {
		int precioFinal;
		
		precioFinal = horas * PRECIO_HORA;
		System.out.println("El precio de la reparación es de "+precioFinal+" euros.");
		return precioFinal;
	}

}
