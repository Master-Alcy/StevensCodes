import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author Jingxuan Ai
 * @date 2018/10/6
 */
public class C9E11LinearEq_C9E12Intersection {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ptln("This program is to demonstrate 2*2 linear equation in following notation:\n"
				+ "ax + by = e\ncx + dy = f");
		test();
	}

	/** test program */
	private static void test() {
		ptln("Asker start.");
		Scanner sc = new Scanner(System.in);
		/** my Asker while loop */
		Asker: while (true) {
			ptln("Enter 1 for LinearEquation test, 2 for IntersectingPoint test.");
			handler: try {
				switch (sc.nextInt()) {
				case 1:
					/** Handle Linear */
					ptln("Enter : a, b, c, d, e, f in order, seperated with space or new line.");
					Double[] input = new Double[6];
					try {
						for (int i = 0; i < 6; i++) {
							input[i] = sc.nextDouble();
						}
						//Note that question required to take each variable in constructor
						LinearEquation le = new LinearEquation(input[0],
								input[1], input[2], input[3], input[4],
								input[5]);
						ptln(le);
						break handler;
					} catch (InputMismatchException e) {
						ptln("Double numbers are expected: " + e);
						break handler; // exception handled, pass to Continuous
										// Asking
					}
				case 2:
					/** Handle Intersection */
					ptln("Enter x1,y1,x2,y2,x3,y3,x4,y4 in order, seperated with space or new line.");
					Double[] points = new Double[8];
					try {
						for (int i = 0; i < 8; i++) {
							points[i] = sc.nextDouble();
						}
						//Note that question doesn't require constructor type.
						LinearEquation section = new LinearEquation(points);
						ptln(section); // Have error in type: Exception.
										// Shouldn't be caught inside case 2.
						break handler;
					} catch (InputMismatchException e) {
						ptln("Double numbers are expected: " + e);
						break handler; // exception handled, pass to Continuous
										// Asking
					}
				default:
					throw new Exception("Error in handler.");
				} // switch ends
			} catch (Exception e) {
				ptln(e);
			}

			sc.nextLine(); // To throw extra arguments
			// No better way to detect this yet!!!
			// Continuous Asking
			ptln("Enter 1 to continue, else to end: ");
			try {
				if (sc.nextInt() != 1) {
					break Asker;
				}
			} catch (InputMismatchException e) {
				break Asker;
			}
		}
		ptln("Asker end.");
		sc.close();
	}

	/** my personal printer */
	private static void ptln(Object str) {
		try {
			System.out.println(str + "");
		} catch (Exception e) {
			System.out.println("Error. Wrong Print Type.");
			e.printStackTrace();
			return;
		}
	}
}

/**
 * my LinearEquation class. Can handle intersection.
 */
class LinearEquation {
	private double a = 0, b = 0, c = 0, d = 0, e = 0, f = 0;
	private double aa = 0;
	private String equation = "";
	private boolean isIntersection = false;

	public LinearEquation(double a, double b, double c, double d, double e,
			double f) {
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.e = e;
		this.f = f;
		this.aa = a * d - b * c;
		this.equation = "In equation " + a + "x + " + b + "y = " + e + "\n"
				+ "            " + c + "x + " + d + "y = " + f + "\n";
		this.isIntersection = false;
	}

	/** use eight points to form two lines. */
	public LinearEquation(Double[] line) throws Exception {
		if (!isValidArray(line)) {
			throw new Exception("Not a valid double array!");
		}
		// [0]x1; [1]y1; [2]x2; [3]y2; [4]x3; [5]y3; [6]x4; [7]y4;
		// ax+by=e; cx+dy=f;
		this.a = line[1] - line[3]; // y1-y2
		this.b = -line[0] + line[2]; // -x1+x2
		this.c = line[5] - line[7]; // y3-y4
		this.d = -line[4] + line[6]; // -x3+x4
		this.e = (line[1] - line[3]) * line[0] - (line[0] - line[2]) * line[1]; // (y1-y2)x1-(x1-x2)y1
		this.f = (line[5] - line[7]) * line[4] - (line[4] - line[6]) * line[5]; // (y3-y4)x3-(x3-x4)y3
		this.aa = (line[1] - line[3]) * (-line[4] + line[6])
				- (-line[0] + line[2]) * (line[5] - line[7]);
		this.equation = "Points:\n(x1,y1): (" + line[0] + "," + line[1]
				+ "), (x2,y2): (" + line[2] + "," + line[3] + "),\n"
				+ "(x3,y3): (" + line[4] + "," + line[5] + "), (x4,y4): ("
				+ line[6] + "," + line[7] + ") \nformed equation:\n" + a
				+ "x + " + b + "y = " + e + "\n" + c + "x + " + d + "y = " + f
				+ "\n";
		this.isIntersection = true;
	}

	private boolean isValidArray(Double[] line) {
		if (line.length != 8) {
			return false;
		}
		for (int i = 0; i < line.length; i++) {
			if (line[i].isNaN()) {
				return false;
			}
		}
		return true;
	}

	public double getA() {
		return a;
	}

	public double getB() {
		return b;
	}

	public double getC() {
		return c;
	}

	public double getD() {
		return d;
	}

	public double getE() {
		return e;
	}

	public double getF() {
		return f;
	}

	public double getAA() {
		return aa;
	}

	public String getEq() {
		return equation;
	}

	public boolean getSec() {
		return isIntersection;
	}

	// Use data with get() to prevent changing data
	public boolean isSolvable() {
		if (getAA() == 0) {
			return false;
		}
		return true;
	}

	public double getX() {
		return (getE() * getD() - getB() * getF()) / getAA();
	}

	public double getY() {
		return (getA() * getF() - getE() * getC()) / getAA();
	}

	public String toString() {
		if (getSec()) {
			if (isSolvable()) {
				return getEq() + "The intersecting point is: " + "(" + getX()
						+ "," + getY() + ")";
			}
			return getEq() + "ad - bc = 0. Two lines are parallel.";
		}
		if (isSolvable()) {
			return getEq() + "x is: " + getX() + "\ty is: " + getY();
		}
		return getEq() + "ad - bc = 0. The equation has no solution.";
	}
}