import java.util.InputMismatchException;
import java.util.Scanner;
/**
 * This is the test triangle class
 * 
 * @version 1.0, 2018/11/04
 * @author Jingxuan Ai
 * @since 1.0
 */
public class C11E1C12E5TestTriangle {

	public static void main(String[] args) {
		ptln("Testing C11E1Triangle_C12E5IllegalTriangleException class, \n"
				+ "Sides need to be positive and two sides should be larger \n"
				+ "than one side. Input should be seperated by one space.");
		Scanner sc = new Scanner(System.in);
		Outer: while (true) {
			try {
				ptln("Enter 3 sides, color and isFilled. Color example: while. \n"
						+ "y for filled, and n for un-filled.");
				double x = sc.nextDouble();
				ptln("Side1 is: " + x);
				double y = sc.nextDouble();
				ptln("Side2 is: " + y);
				double z = sc.nextDouble();
				ptln("Side3 is: " + z);
				String c = sc.next();
				ptln("Color is " + c);
				boolean isFilled;
				String choice = sc.next();
				if (choice.equals("y")) {
					isFilled = true;
				} else if (choice.equals("n")) {
					isFilled = false;
				} else {
					throw new Exception("Invalid choice for isFilled.");
				}
				ptln("isFilled: " + isFilled);
				C11E1Triangle_C12E5IllegalTriangleException myTri = new C11E1Triangle_C12E5IllegalTriangleException(
						x, y, z, c, isFilled);
				// myTri successfully created. Print.
				ptln("----------------Print This Triangle----------------");
				ptln(myTri.toString());
			} catch (Exception ex) {
				ptln(ex.getMessage());
			}
			int input = 1;
			Asker: while (true) {
				ptln("----------------------------------------------\n"
						+ "Test over. Enter 0 for another triangle, \n"
						+ "Enter 1 to exit program.");
				try {
					input = sc.nextInt();
					if (input == 0) {
						break Asker;
					} else if (input == 1) {
						break Outer;
					}// else go to next statement
				} catch (InputMismatchException e) {
					sc.next();
				}
				ptln("InValid input. Need 0/1 only.");
			}// Asker loop ends.
		}// End of outer loop
		sc.close();
		ptln("Program exist.");
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