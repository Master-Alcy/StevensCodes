
import java.util.Scanner;

public class C2E15DisofTwo {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter x1 and y1(Ex: 1.5 -3.4): ");
		double x1 = Double.parseDouble(sc.next());
		double y1 = Double.parseDouble(sc.next());
		System.out.println("Enter x2 and y2(Ex: 1.5 -3.4): ");
		double x2 = Double.parseDouble(sc.next());
		double y2 = Double.parseDouble(sc.next());
		double dis = Math.pow((Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2)), 0.5);
		System.out.println("Distance of two points is: " + dis);
		sc.close();
	}
}