package Projecte;

//Establim les estadístiques del jugador
public class Estadistica extends Equip{
	
	private double pts;
	private double reb;
	private double ast;
	
	public Estadistica(String nomEquip, double pts, double reb, double ast) {
		super(nomEquip);
		this.pts = pts;
		this.reb = reb;
		this.ast = ast;
	}
	
	public double getPts() {
		return this.pts = pts;
	}
	
	public double getReb() {
		return this.reb = reb;
	}
	
	public double getAst() {
		return this.ast = ast;
	}

}
