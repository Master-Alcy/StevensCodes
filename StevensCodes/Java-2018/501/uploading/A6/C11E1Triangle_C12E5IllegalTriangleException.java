/**
 * This is the personal triangle class
 * 
 * @version 1.0, 2018/11/04
 * @author Jingxuan Ai
 * @since 1.0
 */
public class C11E1Triangle_C12E5IllegalTriangleException extends
		C11E1GeometricObject {
	private double side1, side2, side3;

	public C11E1Triangle_C12E5IllegalTriangleException() {
		setSide1(1);
		setSide2(1);
		setSide3(1);
		setColor("white");
		setFilled(false);
	}

	// Test user enter 3 sides, color and filled
	public C11E1Triangle_C12E5IllegalTriangleException(double side1,
			double side2, double side3, String color, boolean isFilled)
			throws IllegalTriangleException {
		if (!validTriangle(side1, side2, side3)) {
			throw new IllegalTriangleException(side1, side2, side3);
		}
		setSide1(side1);
		setSide2(side2);
		setSide3(side3);
		setColor(color);
		setFilled(isFilled);
	}

	private boolean validTriangle(double a, double b, double c) {
		// Must be non-negative and 2 sides > 1 side
		if (a <= 0 || b <= 0 || c <= 0 || a + b <= c || a + c <= b
				|| b + c <= a) {
			return false;
		}
		return true;
	}

	public double getArea() {
		double h = (getSide1() + getSide2() + getSide3()) / 2.0;
		return Math.sqrt(h * (h - getSide1()) * (h - getSide2())
				* (h - getSide3()));
	}

	public double getPerimeter() {
		return 2 * (getSide1() + getSide2() + getSide3());
	}

	@Override
	public String toString() {
		return "Triangle: side1 = " + getSide1() + " side2 = " + getSide2()
				+ " side3 = " + getSide3() + " area = " + getArea()
				+ " perimeter = " + getPerimeter() + "\n" + super.toString();
	}

	public double getSide1() {
		return side1;
	}

	public void setSide1(double side1) {
		this.side1 = side1;
	}

	public double getSide2() {
		return side2;
	}

	public void setSide2(double side2) {
		this.side2 = side2;
	}

	public double getSide3() {
		return side3;
	}

	public void setSide3(double side3) {
		this.side3 = side3;
	}
}

class IllegalTriangleException extends Exception {
	private static final long serialVersionUID = 1L;
	private double side1, side2, side3;

	public IllegalTriangleException(double side1, double side2, double side3) {
		super("Invalid triangle! side1 = " + side1 + " side2 = " + side2
				+ "side3 = " + side3);
		setSide1(side1);
		setSide2(side2);
		setSide3(side3);
	}

	public double getSide1() {
		return side1;
	}

	public void setSide1(double side1) {
		this.side1 = side1;
	}

	public double getSide2() {
		return side2;
	}

	public void setSide2(double side2) {
		this.side2 = side2;
	}

	public double getSide3() {
		return side3;
	}

	public void setSide3(double side3) {
		this.side3 = side3;
	}

}