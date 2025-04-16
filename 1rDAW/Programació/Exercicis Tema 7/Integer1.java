package Exercicis;

public class Integer1 {

	static int value;

	public Integer1(int i) {
		value = i;
	}
	
	public byte byteValue() {
		return (byte)value;
	}
	
	public double doubleValue() {
		return (double)value;
	}
	
	public float floatValue() {
		return (float)value;
	}
	
	public int intValue() {
		return (int)value;
	}
	
	public long longValue() {
		return (long)value;
	}
	
	public short shortValue() {
		return (short)value;
	}
	
	public static int compare(int a, int b) {
		/*return Integer.compare(a, b);*/
		if (a == b) {
			return 0;
		}else if (a < b) {
			return -1;
		}else {
			return 1;
		}
	}
	
	public int compareTo(Integer anotherInteger) {
		/*return anotherInteger.compareTo(value);*/
		if (value == anotherInteger) {
			return 0;
		}else if(value < anotherInteger) {
			return -1;
		}else {
			return 1;
		}
	}
	
	public boolean equals(Object obj) {
		/*return Integer1.equals(value);*/
		if (obj instanceof Integer1) {
			if (this.value == obj.value) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
		
	}
	
	public static int max(int a, int b) {
		/*return Integer1.max(a, b);*/
		if (a > b || a == b) {
			return a;
		}else {
			return b;
		}
	}
	
	public static int min(int a, int b) {
		/*return Integer1.min(a, b);*/
		if (a < b || a == b) {
			return a;
		}else {
			return b;
		}
	}	
	
	public static int sum(int a, int b) {
		/*return Integer1.sum(a, b);*/
		return a+b;
	}
	
	public String toString() {
		return value + " ";
	}
	
	
	//A partir d'aquí no entenc com he de generar els mètodes
	public static int parseInt(String s) {
		return Integer.parseInt(s);
	}
	
	public static Integer1 valueOf(int i) {
		/*return Integer1.valueOf(i);*/
		if (i.instanceOf(Integer1) == true) {
			return Integer1.valueOf(i);
		}
	}
	
	public static Integer1 valueOf(String s) {
		/*return Integer1.valueOf(s);*/
		if (s.instanceOf(Integer1) == true) {
			return Integer1.valueOf(s);
		}
	}
	
	public static String toString(int i) {
		return Integer1.toString(i);
	}

}
