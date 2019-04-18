import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author Jingxuan Ai
 * @date 2018/10/6
 */
public class C9E1RectangleClassWithErrorHandling {
	/**
	 * @param args
	 *            This is test main().
	 */
	public static void main(String[] args) {
		ptln("For Question 9.1. I'll print out rectangle with 0 parameter first, "
				+ "\nthen the two from question requirement. After they are fullfilled,"
				+ "\nI'll start my Asker function for user input.");
		test();
	}

	/** This is where actual test begin */
	private static void test() {
		try {
			Rectangle R1 = new Rectangle();
			Rectangle R2 = new Rectangle(4, 40);
			Rectangle R3 = new Rectangle(3.5, 35.9);
			ptln(R1 + "\n\n" + R2 + "\n\n" + R3);
			ptln("\nNow the question requirement fullfilled. "
					+ "\nEnter Asker for customized input.");
			Asker();
		} catch (Exception e) {
			ptln("Exception in Asker() itself!" + e);
		}
	}

	/** my Asker for user input and error checking */
	private static void Asker() {
		ptln("Asker start.");
		Scanner sc = new Scanner(System.in);
		Asker: while (true) {
			ptln("Enter width and height numbers seperated by space or new line: ");
			try {
				double width = sc.nextDouble();
				double height = sc.nextDouble();
				Rectangle Rx = new Rectangle(width, height);
				ptln(Rx);
			} catch (InputMismatchException e1) {
				ptln("Two double numbers are expected: " + e1);
			} catch (Exception e2) {
				ptln("Error: " + e2);
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

/** my simple rectangle class */
class Rectangle {
	/** width and height default to 1 */
	private double width = 1;
	private double height = 1;

	/** no-arg constructor */
	public Rectangle() {
	}

	/**
	 * constructor with width and height 
	 * The only exception handler inside Rectangle
	 */
	public Rectangle(double width, double height) throws Exception {
		if (!isValid(width, height)) {
			Exception e = new Exception(
					"Width or height not valid!. Both must be positive.");
			throw e;
		}
		this.width = width;
		this.height = height;
	}

	/** Check input. Need positive numbers. */
	private boolean isValid(double width, double height) {
		if (width <= 0 || height <= 0) {
			return false;
		}
		return true;
	}

	/** return area */
	public double getArea() {
		return this.width * this.height;
	}

	/** return perimeter */
	public double getPerimeter() {
		return 2 * (this.width + this.height);
	}

	/** toString for rectangle */
	public String toString() {
		return "Width is: " + width + "\tHeight is: " + height + "\nArea is: "
				+ getArea() + "\tPerimeter is: " + getPerimeter();
	}
}