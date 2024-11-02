/**
* <h2>Classe Empleat, per crear i llegir empleats d’una BD</h2>
*
* Cerca info de javadoc a <a href="https://google.com">GOOGLE</a>
* @see <a href="https://google.com">Google </a>
* @version 1-2020
* @author ARM
* @since 1-1-2020
*/
public class DocumentacioJava {
	/**
	* Atribut nom de l’empleat
	*/
	private String nom;
	/**
	* Atribut llinatge de l’empleat
	*/
	private String llinatge;
	/**
	* Atribut sou de l’empleat
	*/
	private double sou;
	/**
	* Constructor amb 3 paràmetres.
	* Crea objectes empleat, amb nom, llinatge i sou.
	* @param nom <i>Nom de l’empleat</i>
	* @param llinatge <i>Llinatge de l’empleat</i>
	* @param sou <i>Sou de l’empleat</i>
	*/
public DocumentacioJava(String nom, String llinatge, double sou){
	this.nom = nom;
	this.llinatge = llinatge;
	this.sou = sou;
}
	//Mètodes públics
	/**
	* Puja el sou a l’empleat.
	* @see DocumentacioJava
	* @param pujada <i>Pujada a aplicar al sou</i>
	*/
	public void pujadaSou (double pujada){
	sou = sou + pujada;
	}
	//Mètodes privats
	/**
	* Comprova que el nom no estigui buit
	* @return <ul>
	* <li>true: el nom és una cadena buida</li>
	* <li>false: el nom no és una cadena buida</li>
	
	* </ul>
	*/
	private boolean comprovar (){
	if (nom.equals("")){
	return false;
	}
	return true;
	}
	}