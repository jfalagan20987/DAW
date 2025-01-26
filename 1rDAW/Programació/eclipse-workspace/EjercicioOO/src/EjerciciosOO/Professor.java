package EjerciciosOO;

public class Professor {

	private String asignatura;

	public Professor(String asignatura) {
		super();
		this.asignatura = asignatura;
	}
	
	public void mostrarDades() {
		super.mostrarDades();
		System.out.println("Asigantura: "+asignatura);
	}
	
	

}
