package A6;

public class Note_11_1 extends Employee {
	public static void main(String[] args) {
		new Note_11_1();
		A1 a1 = new A1();
		A2 a2 = new A2();
		a1.p(10);
		a1.p(10.0);
		a2.p(10);
		a2.p(10.0);
	}
	// To allow subclass access data fields or methods in superclass
	// we use protected keyword
	public Note_11_1() {
		System.out.println("(4) Performs Note_11_1's tasks");
	}
	// Can't use super.super
	public final class NoNo {
		//This class cannot be extended
		public final void m() {
			//This method cannot be overridden by subclasses
		}
	}
}

/** class B extend Object if none defined */
class B {
	public void p(double i) {
		System.out.println(i * 2);
	}
}

/** overrides, new implementation for p */
class A1 extends B {

	@Override
	public void p(double i) {
		System.out.println(i);
	}
}

/** overloads, new method with same name but different param */
class A2 extends B {
	public void p(int i) {
		System.out.println(i);
	}
}

class Employee extends Person {
	public Employee() {
		this("(2) Invoke Employee's overloaded constructor");
		System.out.println("(3) Performs Employee's tasks ");
	}

	public Employee(String s) {
		System.out.println(s);
	}

	public String toString() {
		return super.toSting() + "Processed in Employee";
	}

}

class Person {
	public Person() {
		System.out.println("(1) Performs Person's tasks");
	}

	public String toSting() {
		return "Test toString and super, at Person. ";
	}
}