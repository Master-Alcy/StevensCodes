package A6;

/*
 * public static void displayObject(SimpleGeometricObject object) {
 * System.out.println("Created on " + object.getDateCreated() + ". Color is " +
 * object.getColor()); }
 */

// The method in most specific class is searched first until Object
// class. First-Found-First-Use. <= Dynamic Binding
public class PolymorphismDemo {
	// encapsulation (getter and setter)
	// inheritance (super, this, extends)
	// polymorphism
	// abstract

	public static void main(String[] args) {
		// A variable of a supertype can refer to a subtype object

		/*
		 * displayObject(new CircleFromSimpleGeometricObject (1, "red", false));
		 * displayObject(new RectangleFromSimpleGeometricObject (1, 1,
		 * "black",true));
		 */
		m(new GraduateStudent());
		m(new Student());
		m(new Person1());
		m(new Object());
		// Implicit casting (upcasting)
		Object o = new Student();	//Not vice versa
		m(o);
		// Explicit casting (downcasting)
		Student b = (Student) o;
		m(b);
		if (b instanceof Person1) {
			// Note_11_1 . is before casting. Use ()
			System.out.println(((Person1)b).getA());
		}
	}

	public static void m(Object x) {
		System.out.println(x.toString());
	}
}

class GraduateStudent extends Student {
}

class Student extends Person1 {
	@Override
	public String toString() {
		return "Studet";
	}
}

class Person1 extends Object {
	private int a = 1;
	public int getA(){
		return a;
	}
	@Override
	public String toString() {
		return "Person";
	}
}