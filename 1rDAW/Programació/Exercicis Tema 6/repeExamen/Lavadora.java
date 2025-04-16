package repeExamen;

public class Lavadora extends Electrodomestico implements enReparacion{

	private String marcaLavadora;
	
	public Lavadora(int precio, String marcaLavadora) {
		this.precio = precio;
		this.marcaLavadora = marcaLavadora;
	}
	
	public Lavadora() {
		
	}
	
	public int getPrecio() {
		return this.precio = precio;
	}
	
	public String getMarcaLavadora() {
		return this.marcaLavadora = marcaLavadora;
	}
	
	public String toString() {
		String datosLavadora = "";
		return datosLavadora = datosLavadora + "DATOS LAVADORA"+"\n"+"Marca: "+marcaLavadora+"\n"+"Precio: "+precio+"\n";
	}

	@Override
	public void reparar(int horas) {
		int precioFinal;
		
		precioFinal = PRECIO_HORA * horas;
		System.out.println("El precio de la reparación es de "+precioFinal+" euros.");
		
	}
}
