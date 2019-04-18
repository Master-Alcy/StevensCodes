package A2;
import java.util.Scanner;

public class C3E27PointsInTri {

	public static void main(String[] args) {
		//y = -0.5x + 100
		Scanner sc = new Scanner(System.in);
		System.out.println("A point is inside also means that it's not on the edge.");
		System.out.println("Enter a point (x0, y0)(Ex: 1.0 2.0): ");
		double x = Double.parseDouble(sc.next());
		double y = Double.parseDouble(sc.next());
		if (x <= 0 || x >= 200 || y <= 0 || y >= 100 ||
			y >= -0.5 * x + 100){
			System.out.println("The point is not in the triangle.");
		}else{
			System.out.println("The point is in the triangle.");			
		}
		sc.close();
	}
}