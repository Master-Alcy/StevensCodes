import java.util.InputMismatchException;
import java.util.Scanner;
/**
 * This is the test rectangle class
 * 
 * @version 1.0, 2018/11/04
 * @author Jingxuan Ai
 * @since 1.0
 */
public class C10E13TestMyRect2D {

	public static void main(String[] args) {
		// Start Constructing loops
		ptln("Testing C10E13MyRectangle2D class, \n"
				+ "width and height need to be positive. \n"
				+ "Input should be seperated by one space.");
		ptln("My defination for contain: NOT includes edges, \n"
				+ "for overlaps: Not includes edges, \n"
				+ "for abut: Includes edges, \n"
				+ "for distinct: NOT includes edges.");
		Scanner sc = new Scanner(System.in);
		// Outer loop to enter base rectangle
		Outer: while (true) {
			// -------------- base -------------------
			C10E13MyRectangle2D RBASE;
			C10E13MyRectangle2D RTEST;
			try {
				ptln("Enter base rectangle with order: x,y,width,height: ");
				double x = sc.nextDouble();
				ptln("X-axis is: " + x);
				double y = sc.nextDouble();
				ptln("Y-axis is: " + y);
				double w = sc.nextDouble();
				ptln("Width is: " + w);
				double h = sc.nextDouble();
				ptln("Height is: " + h);
				RBASE = new C10E13MyRectangle2D(x, y, w, h);
			} catch (Exception e) {
				// sc.nextLine();
				ptln("At AskBase: " + e);
				ptln("Re-enter base rectangle.");
				continue Outer;
			}
			// Got one base rectangle here if no error
			// ---------------test----------------------
			// Inner loop to enter test rectangle
			Inner: while (true) {
				try {
					ptln("Enter test rectangle with order: x,y,width,height: ");
					double x = sc.nextDouble();
					ptln("X-axis is: " + x);
					double y = sc.nextDouble();
					ptln("Y-axis is: " + y);
					double w = sc.nextDouble();
					ptln("Width is: " + w);
					double h = sc.nextDouble();
					ptln("Height is: " + h);
					RTEST = new C10E13MyRectangle2D(x, y, w, h);
					// Got one test rectangle here if no error
					testTwoRects(RBASE, RTEST);
					// ---------Test over. Ask continue-------------------
					int input = 2;
					Asker: while (true) {
						ptln("----------------------------------------------\n"
								+ "Test over. Enter 0 for another Test rectangle, \n"
								+ "Enter 1 for another Base rectangle, \n"
								+ "Enter 2 to exit the whole program.");
						try {
							input = sc.nextInt();
							if ((input == 0) || (input == 1) || (input == 2)) {
								break Asker;
							}
						} catch (InputMismatchException e) {
							sc.next();
						}
						ptln("InValid input. Need 0/1/2 only.");
					}	// Asker loop ends.
					switch (input) {
					case 0: // new Test Rectangle
						continue Inner;
					case 1: // new Base Rectangle
						continue Outer;
					case 2: // Abort Whole Testing
						break Outer;
					}
				} catch (Exception e) {
					// sc.nextLine();
					ptln("At AskTest: " + e);
					ptln("Re-enter test rectangle.");
					continue Inner;
				}
			} // Inner loop ends.
		} // Outer loop ends
		sc.close();
		ptln("Whole asker ends. Program stops.");
	}

	/** Helper function for comparing two rectangles */
	private static void testTwoRects(C10E13MyRectangle2D rBase,
			C10E13MyRectangle2D rTest) {
		// Test contain
		ptln("");
		ptln("Check contain: " + rBase.contains(rTest));
		// Test overlap 
		ptln("Check overlaps: " + rBase.overlaps(rTest));
		// Test abut
		ptln("Check abut: " + rBase.abut(rTest));
		// Test distinct
		ptln("Check distinct: " + rBase.distinct(rTest));
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