package NewPackage;

public class CalculRectangle {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int costatGran = 8;
		int costatPetit = 3;
		
		int p = ((costatGran * costatGran) + (costatPetit * costatPetit));
		//p = perímetre
		System.out.print("El perímetre és: ");
		System.out.println(p);
		
		int a = costatGran * costatPetit;
		//a = àrea
		System.out.print("L'àrea és: ");
		System.out.println(a);

	}

}
