/** TestGarage.java
 * @author Peter Jurkat
 * pjurkat@unm.edu
 * 
 * Homework2Answer - Spring 2oo9
 */

package mypackage1;

public class TestGarage
{
	public TestGarage() {
	} // end default constructor

	public static void main(String[] args) {
		run();	
//		TestGarage testGarage = new TestGarage();
	} // end main()
	
/** run()
 */
	public static void run()
	{
		// test Garage() default constructor
		System.out.println("\nTesting Garage default constructor");
		Garage gar = null;
		try{
			gar = new Garage();
		} // end try
		catch(Exception e) {
			System.out.println("Garage default constructor threww" +
					" Exception w/ message = " + e.getMessage());
			System.exit(33);
		} // end e catch
		printGarage(gar);
		
	} // end run

/** printGarage()
 */
	public static void printGarage(Garage g)
	{
		System.out.println("");
		if(g == null) {
			System.out.println("Garage object == null !");
			return;
		} // end if
		
		String className = g.getClass().getName();
		
		System.out.println(className + ".buildingID = " +
				g.getBuildingID());
		System.out.println(className + ".numberOfFloors = " +
				g.getNumberOfFloors());
		System.out.println(className + ".basementFlag = " +
				g.getBasementFlag());
		System.out.println("");
		System.out.println(className + ".garageID = " +
				g.getGarageID());
		System.out.println(className + ".numberOfBasementFloors = " +
				g.getNumberOfBasementFloors());
		System.out.println(className + ".numberOfSpaces = " +
				g.getNumberOfSpaces());
		
	} // end printGarage
	
} // end Test Garage class
