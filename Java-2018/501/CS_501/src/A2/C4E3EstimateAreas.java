package A2;

public class C4E3EstimateAreas {

	public static void main(String[] args) {
		System.out.println("The followings are locations' names and \n"
				+ "their longitudes, latitudes in decimal coordinates:\n");
		System.out.println("Atlanta, Georgia: 33.7489954,-84.3879824");
		double x1 = Math.toRadians(33.7489954);
		double y1 = Math.toRadians(-84.3879824);
		System.out.println("Orlando, Florida: 28.5383355,-81.37923649999999");
		double x2 = Math.toRadians(28.5383355);
		double y2 = Math.toRadians(-81.37923649999999);
		System.out.println("Savannah, Georgia: 32.0808989,-81.09120300000001");
		double x3 = Math.toRadians(32.0808989);
		double y3 = Math.toRadians(-81.09120300000001);
		System.out.println("Charlotte, North Carolina: 35.2270869,-80.84312669999997");
		double x4 = Math.toRadians(35.2270869);
		double y4 = Math.toRadians(-80.84312669999997);
		System.out.println("\nProcedure:\n");
		//1,2,3
		double side1 = 6371.01 * Math.acos(Math.sin(x1) * Math.sin(x2) + 
				Math.cos(x1) * Math.cos(x2) * Math.cos(y1 - y2));
		double side2 = 6371.01 * Math.acos(Math.sin(x2) * Math.sin(x3) + 
				Math.cos(x2) * Math.cos(x3) * Math.cos(y2 - y3));
		double side3 = 6371.01 * Math.acos(Math.sin(x1) * Math.sin(x3) + 
				Math.cos(x1) * Math.cos(x3) * Math.cos(y1 - y3));
		double s = (side1 + side2 + side3) / 2.0;
		double area1 = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
		System.out.println("Side1 is: " + side1);
		System.out.println("Side2 is: " + side2);
		System.out.println("Side3 is: " + side3);
		System.out.println("Area1 is: " + area1);
		//1,3,4
		side1 = 6371.01 * Math.acos(Math.sin(x1) * Math.sin(x3) + 
				Math.cos(x1) * Math.cos(x3) * Math.cos(y1 - y3));
		side2 = 6371.01 * Math.acos(Math.sin(x3) * Math.sin(x4) + 
				Math.cos(x3) * Math.cos(x4) * Math.cos(y3 - y4));
		side3 = 6371.01 * Math.acos(Math.sin(x1) * Math.sin(x4) + 
				Math.cos(x1) * Math.cos(x4) * Math.cos(y1 - y4));
		s = (side1 + side2 + side3) / 2.0;
		double area2 = Math.pow(s * (s - side1) * (s - side2) * (s - side3), 0.5);
		System.out.println("Side1 is: " + side1);
		System.out.println("Side2 is: " + side2);
		System.out.println("Side3 is: " + side3);
		System.out.println("Area2 is: " + area2);
		System.out.println("\nTotal area is: " + (area1 + area2) + " km^2.");
	}
}