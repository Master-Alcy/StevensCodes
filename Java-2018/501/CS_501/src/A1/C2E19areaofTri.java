package A1;

import java.util.Scanner;

public class C2E19areaofTri {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enetr three points for a triangle: ");
		double x1 = Double.parseDouble(sc.next());
		double y1 = Double.parseDouble(sc.next());
		double x2 = Double.parseDouble(sc.next());
		double y2 = Double.parseDouble(sc.next());
		double x3 = Double.parseDouble(sc.next());
		double y3 = Double.parseDouble(sc.next());
		double side1 = Math.pow((Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2)), 0.5);
		double side2 = Math.pow((Math.pow(x3 - x2, 2) + Math.pow(y3 - y2, 2)), 0.5);
		double side3 = Math.pow((Math.pow(x1 - x3, 2) + Math.pow(y1 - y3, 2)), 0.5);
		double s = (side1 + side2 + side3) / 2.0;
		double area = Math.pow(s * (s - side1) * (s - side2) * (s - side3), 0.5);
		System.out.println("The area of this triangle is: " + area);
		sc.close();
	}
}