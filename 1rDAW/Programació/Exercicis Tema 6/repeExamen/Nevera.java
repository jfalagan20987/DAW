package repeExamen;

public class Nevera extends Electrodomestico implements enReparacion{
	
	private String marcaNevera;
	
	public Nevera(int precio, String marcaNevera) {
		this.precio = precio;
		this.marcaNevera = marcaNevera;
	}
	
	public Nevera() {
		
	}
	
	public int getPrecio() {
		return this.precio = precio;
	}
	
	public String getMarcaNevera() {
		return this.marcaNevera = marcaNevera;
	}
	
	public String toString() {
		String datosNevera = "";
		return datosNevera = datosNevera + "DATOS NEVERA"+"\n"+"Marca: "+marcaNevera+"\n"+"Precio: "+precio+"\n";
	}
	
	@Override
	public void reparar(int horas) {
		int precioFinal;
		
		precioFinal = PRECIO_HORA * horas;
		System.out.println("El precio de la reparación es de "+precioFinal+" euros.");
		
	}

}
