package three;

//import static net.mindview.util.Print.*;
import static three.PrintT.pt;

import java.util.Arrays;
import java.util.Date;
import java.util.Random;

public class HelloDate_print {

	public static void main(String[] args) {
		// print("Hello. It's: ");
		// print(new Date());
		HelloDate_print t = new HelloDate_print();
		pt("Hello. It's: ");
		pt(new Date() + "");
		pt(new Date());
		pt('a');
		pt(1);
		pt(Arrays.toString(t.testPt()));
		
		Tank t1 = new Tank();
		Tank t2 = new Tank();
		t1.level = 1;
		t2.level = 2;
		pt(t1.level + " " + t2.level);
		// operating the reference of objects
		// t1.level = t2.level would be different
		t1 = t2;
		pt(t1.level + " " + t2.level);
		t1.level = 3;
		pt(t1.level + " " + t2.level);
		// object to method
		Letter x = new Letter();
		x.c = 'a';
		pt(x.c);
		f(x);
		pt(x.c);
		
		int i = 1;
		pt("test ++");
		pt(i);		//1
		pt(i++);	//1	value before calc
		pt(++i);	//3	value after calc
		pt(++i);	//4	value after
		pt(i++);	//4	value before
		pt(i);		//5
		
		Integer n1 = new Integer(47);
		Integer n2 = new Integer(47);
		pt(n1 == n2);		//comparing object's reference
		pt(n1 != n2);		//comparing object's reference
		pt(n1.equals(n2));	//comparing reference
		Value v1 = new Value();
		Value v2 = new Value();
		v1.i = v2.i = 100;
		pt(v1.equals(v2));	//comparing reference
		pt(v1.i == v2.i);	//comparing object's reference
		
		Random rand = new Random(100);
		pt(rand.nextInt(100) + " " + rand.nextDouble());
	}

	private static void f(Letter y) { // parameter as object
		y.c = 'z';
	}

	private int[] testPt() {
		int[] a = { 1, 2, 3 };
		return a;
	}
}

class Tank {
	float level;
}

class Letter {
	char c;
}

class Value {
	int i;
}