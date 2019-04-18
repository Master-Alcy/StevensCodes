/** Garage.java - included as an example of child class declartion
 * Peter Jurkat
 * pjurkat@unm.edu
 * 
 * Homework2Answer - Spring 2007
 * 
 * only the constructors are shown explicitly - all other methods follow
 * patterns similar to those in Building.java
 * 
 */

package mypackage1;

public class Garage extends Building	// indicates this is a child
										// class of Building
{
	// parameters
	private String garageID = "";
	private int numberOfBasementFloors = 0;		// must be non-negative
	private int numberOfSpaces = 1;				// not much of a garage
												// if less than one
												// parking space - must
												// be non-negative
	
	public Garage() {
		super();		// this statement not needed - will be supplied
						// if left out
	} // end default constructor
	
/** fpzc - notice that all the parent (Building) parameters are inlcuded
 * as arguments - this allows a parent Building object ot be constructed
 * with a single call to a construct a Garage object with its parent
 * Buidling object
 */
	public Garage(String _garageID, int _numberOfFloors,
			boolean _basementFlag, int _numberOfBasementFloors,
			int _numberOfSpaces) throws Exception
	{
		super(_garageID, _numberOfFloors, _basementFlag);
		garageID = _garageID;
		setNumberOfBasementFloors(_numberOfBasementFloors);
		setNumberOfSpaces(_numberOfSpaces);
		
	} // end fpzc
	
	// accessor methods
	public String getGarageID() { return garageID; }
	public int getNumberOfBasementFloors()
			{ return numberOfBasementFloors; }
	public int getNumberOfSpaces() { return numberOfSpaces; }

	// mutator methods
	
/** setNumberOfBasementFloors()
 */
	public void setNumberOfBasementFloors(int _numberOfBasementFloors)
			throws Exception
	{
		
	} // end setNumberOfBasementFloors()
	
/** setNumberOfSpaces()
 */
	public void setNumberOfSpaces(int _numberOfSpaces) throws Exception
	{
		
	} // end setNumberOfSpaces
	
} // end Garage class
