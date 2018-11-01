package two;

//{Args: A B C}

public class Practice {

	@SuppressWarnings("unused")
	public static void main(String[] args) {
		Pone p1 = new Pone();
		System.out.println(p1.a);
		System.out.println(p1.b);	//cant read??
		ATypeName a = new ATypeName();
		Integer c = 1;
		int d = c;
		System.out.println(d);
		double e = 1.0;
		Double f = e;
		System.out.println(f);
		if (args.length < 3){
			System.out.println("Number of args: " + args.length);
			System.exit(0);
		}
		System.out.println(args[0]);
		System.out.println(args[1]);
		System.out.println(args[2]);
	}
}

class Pone {
	int a;
	char b;
}

class ATypeName {
}

class DataOnly {
	//int a double b ...
}