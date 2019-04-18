package A7;

public class Note_13_1 {

	/**
	 * Cohesion	(凝聚)
	 * Consistency (一致性)
	 * Encapsulation (封装)
	 * Clarity (Name should be clear)
	 * Completeness (完整)
	 * A variable or method that is dependent on a specific instance of 
	 * the class must be an instance variable or method. 
	 * A variable that is shared by all the instances of a class 
	 * should be declared static.
	 * Inheritance: is-a
	 * Aggregation: has-a
	 * Interfaces: week is-a
	 * Abstract Classes: strong is-a
	 */

	public static void main(String[] args) {
		Note_13_1 n = new Note_13_1();
		GeometricObject o1 = n.new Circle();
		GeometricObject o2 = n.new Rectangle();
		System.out.println(equalArea(o1, o2));
		displayGO(o1);
		displayGO(o2);
		GeometricObject[] oArr = new GeometricObject[10];
		oArr[1] = n.new Circle();
		oArr[0] = n.new Rectangle();

		Edible stuff = n.new Chicken();
		eat(stuff);
		stuff = n.new Duck();
		eat(stuff);
		stuff = n.new Broccoli();
		eat(stuff);
	}

	public interface Comparable<E> {
		public int compareTo(E o);
	}

	public interface Edible {
		public abstract String howToEat();
	}

	public static void eat(Edible stuff) {
		stuff.howToEat();
	}

	interface Edible2 {
		public String howToEat();
	}

	class Chicken2 implements Edible2 {
		@Override
		public String howToEat() {
			return "Fry it";
		}
	}

	class Duck implements Edible {
		@Override
		public String howToEat() {
			return "Roast it";
		}
	}

	class Broccoli implements Edible {
		@Override
		public String howToEat() {
			return "Stir-fry it";
		}
	}

	abstract class Animal {
		public abstract String sound();
	}

	private class Chicken extends Animal implements Edible {
		@Override
		public String howToEat() {
			return "Chicken: Fry it";
		}

		@Override
		public String sound() {
			return "Chichen: cock";
		}
	}

	public static boolean equalArea(GeometricObject o1, GeometricObject o2) {
		return o1.getArea() == o2.getArea();
	}

	public static void displayGO(GeometricObject o) {
		System.out.println(o.getArea());
		System.out.println(o.getPerimeter());
	}

	public abstract class GeometricObject {

		/** Abstract method getArea */
		public abstract double getArea();

		/** Abstract method getPerimeter */
		public abstract double getPerimeter();

	}

	public class Circle extends GeometricObject {

		public Circle() {
		}

		@Override
		public double getArea() {
			return 0;
		}

		@Override
		public double getPerimeter() {
			return 0;
		}
	}

	public class Rectangle extends GeometricObject {

		@Override
		public double getArea() {
			return 0;
		}

		@Override
		public double getPerimeter() {
			return 0;
		}
	}

}
