import java.util.Scanner;

public class C4E2GreatCircleDis {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter point 1 (latitude and longitude) in degrees: ");
		double x1 = Math.toRadians(Double.parseDouble(sc.next()));
		double y1 = Math.toRadians(Double.parseDouble(sc.next()));
		System.out.println("Enter point 2 (latitude and longitude) in degrees: ");
		double x2 = Math.toRadians(Double.parseDouble(sc.next()));
		double y2 = Math.toRadians(Double.parseDouble(sc.next()));
		double d = 6371.01 * Math.acos(Math.sin(x1) * Math.sin(x2) + 
				Math.cos(x1) * Math.cos(x2) * Math.cos(y1 - y2));
		System.out.println("Great Circle Distance is: " + d + " km.");
		sc.close();
	}
}