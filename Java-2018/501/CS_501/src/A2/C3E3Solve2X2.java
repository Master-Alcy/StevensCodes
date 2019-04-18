package A2;
import java.util.Scanner;

public class C3E3Solve2X2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("For equations ax + by = c and dx + ey = f,");
		System.out.println("Enter a, b, c, d, e, f and seperated by a space: ");
		double a = Double.parseDouble(sc.next());
		double b = Double.parseDouble(sc.next());
		double c = Double.parseDouble(sc.next());
		double d = Double.parseDouble(sc.next());
		double e = Double.parseDouble(sc.next());
		double f = Double.parseDouble(sc.next());
		if (a * e == b * d){
			System.out.println("The equation has no solution.");
			System.exit(0);
		}
		double x = (b * f - e * c) / (b * d - a * e);
		double y = (a * f - d * c) / (a * e - b * d);
		System.out.println("x is " + x + " and y is " + y +".");
		sc.close();
	}
}