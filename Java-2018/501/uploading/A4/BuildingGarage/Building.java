/** Building.java - included as an example of class declaration
 * Peter Jurkat
 * 
 * Homework1StartingPoint - Spring 2007
 * 
 * note some format practices:
 * 	all lines are within a margin of 72 characters, a common printer
 *  line right margin - JDeveloper allows  the right margin indicator to
 *  be set in Tools -> Preferences -> Code Editor -> Display
 *  
 *  all close braces } are commented to indicate roughtly where the
 *  corresponding open brace { is - missmatched braces are a common
 *  source of bugs - for example, note that the opening class brace is
 *  in line 19 whereas its corresponding close brace is in last line of
 *  the class code which can be up to 4 pages later when printed - it is
 *  easy to lose track of brace pairs across many lines of code
 */

package mypackage1;

public class Building				// class declaration
{

//  Parameter declarations - also know as attributes, characteristics,
//  and variables
    private String buildingID = "";
    private int numberOfFloors = 1;				// not counting basement
    private boolean basementFlag = false;		// true if basement exists
												// false if not
												// ASM building not
     
     static final int EXPECTED_BUILDING_ID_LENGTH = 3;
									// needed for buildingID validation
     
     private String errorMessage = "";
					// used to allow error messages to be retrieved
					// by calling programs
     
/** Default constructor
 * creates a building object with default parameter values as defined
 * in the parameter declarations above - called by another program
 * using a statement like
 * 		Building asm = new Building();
 * after which asm is a Building object which can be used by the program
 */
    public Building()
    {
    } // end default constructor

/** Fully parameterized constructor often abbreviated as fpzc
 * creates a building object with input parameter values
 * called by another program with a statement like
 * 		Building asm = new Building("ASM", 2, false);
 * if input value is invalid will receive Exception from the set()
 * function and automatically throw it to the calling program
 * calling program must embed call to this constructor in a try-catch
 * block
 */
    public Building(String _buildingID, int _numberOfFloors,
                              boolean _basementFlag) throws Exception
    {
        setBuildingID(_buildingID);           
        setNumberOfFloors(_numberOfFloors);
        setBasementFlag(_basementFlag);
    } // end fpzc

// get (accessor) functions - any method that returns a single variable
// is often called a function
// called by other programs to retrieve Building object parameter values
// could include authorization checks
    public String getBuildingID() { return buildingID; } 
    public int getNumberOfFloors() { return numberOfFloors; }
    public boolean getBasementFlag() { return basementFlag; }
	
	// set up accessor for errorMessage
	public String getErrorMessage() { return errorMessage; }
    // end get funtions

/** toString()
 * method to allow meaningful text to be printed when an object handle
 * is given in a println() statement - if not present then the object
 * handle is printed which is usually meaningless to the reader
 */
	public String toString() {
		return "buildingID = " + buildingID;
	} // end toString()

/** equals()
 * method to determine is two Building objects are equal - requires both
 * to be Building objects and have parameters with equal values
 * input argument is an unspecified object o
 */
	public boolean equals(Object o) {
		// check for null parameter
		if( o == null) return false;
		
		// check for object type
		String s = o.getClass().getName(); // method to get class name
		if( !s.equals("mypackage1.Building")) return false;
		
		// check for equivalent parameter values
		Building b = (Building) o;	// cast unspecified object to
								// Building object in order to be able
								// to use Building get() functions
		if( !buildingID.equals(b.getBuildingID())) return false;
		if(	numberOfFloors != b.getNumberOfFloors()) return false;
		if( basementFlag != b.getBasementFlag()) return false;
		
		return true;
		
	} // end equals

/** print fuction used primarily for debugging - often not included when class
 * is embedded in a larger application
 */
    public void print() {
        System.out.println("Building ID = " + buildingID);
        System.out.print("Number of Floors = ");
        System.out.println(numberOfFloors);
        System.out.print("Presence of Basement = ");
        System.out.println(basementFlag);
    } // end print()

     // set (mutator) functions

/** setBuildingID()
 * allows other programs to request that parameter values be set to
 * a value by a statement like
 * 		asm.setBuildingID("ASM");
 * if this method is called directly by another program not a
 * constructor the call must be embeded in a try-catch block
 * could also include authorization checks
 */
    public void setBuildingID(String _buildingID) throws Exception
    {
        // check if _buildingID has valid value
		// if not throw Exception
		if( !isValidBuildingID( _buildingID)) 
        {
            // Exception is a class that comes with the Java compiler -
			// in the following case the handle of the Exception object
			// is e and its most important parameter is a String
			// usually containing a message from the user of the program
			// indicating the nature of the Exception - care should be
			// taken to make the message as informative as possible - 
			// in the case the message was created by the validation
			// method and stored in the String variable errorMessage -
			// this message will be sent on as the value of the message
			// parameter of the object e
			Exception e = new Exception(errorMessage);
            throw e;
//            System.out.println(errorMessage);
//            return false;
        } // end if( !isValid.....
		
		// if valid set the parameter value
        buildingID = _buildingID;
		// until the above statement no change had been made to the
		// parameter value

    } // end setBuildingID()
     
/** setNumberOfFloors()
 * similar comments to those in setBuildingID() above
 */
    public void setNumberOfFloors(int _numberOfFloors)
                                                    throws Exception
    {
        if( !isValidNumberOfFloors( _numberOfFloors)) 
        {
           Exception e = new Exception(errorMessage);
           throw e;
//			 temporary print statements often used during debugging
//           System.out.println(errorMessage);
//           return false;
        } // end if( !isValid ...
		
        numberOfFloors = _numberOfFloors;
//        return true;

        } // end setNumberOfFloors()
		
/** setBasementFlag()
 * similar comments to those in setBuildingID() above except that with
 * a boolean input which can only be true or false no separate
 * validation has to be done - the run time system will complain if
 * the input argument is not boolean
 */
    public void setBasementFlag(boolean _basementFlag)
                                                throws Exception
    {
 
        // no validation test needed - declarations will test this to be boolean
        basementFlag = _basementFlag;
        return;
	} // end setNumberOfFloors()

/** isValidBuildingID() - returns true if _buildingID is
 * a String of EXPECTED_BUILDING_ID_LENGTH upper case letters
 */
    public boolean isValidBuildingID(String _buildingID)
    {
        // default check
		if(_buildingID.equals(""))return true;
        
        // check length - if not as expected formulate an error message
		// and return false
        if( _buildingID.length() != EXPECTED_BUILDING_ID_LENGTH)
        {
            errorMessage =
                    "Invalid Building ID length: expected to be " +
                                         EXPECTED_BUILDING_ID_LENGTH;
            return false;
        } // building length check
         
        // check if every character is upper case - of not formulate an
		// error message and return false
        for(int i = 0; i < EXPECTED_BUILDING_ID_LENGTH; i++)
        {
            if(!Character.isUpperCase(_buildingID.charAt(i)))
            {
                errorMessage =
                    "Invalid Building ID: must be upper case letters";
                return false;
            } // end upper case check
        } // end for loop
       
        // get here if valid so return true
        return true;
    } // end isValidBuildingID()
     
/** isValidNumberOfFloors() - returns true if non-negative integer
 * similar comments as those in isValidBuildingID()
 */
    public boolean isValidNumberOfFloors(int _numberOfFloors)
    {
        if(_numberOfFloors > 0) return true;
        errorMessage = "Invalid number of floors:" + " needs to be > 0";
		return false;
    } // end isValidNumberOfFloors()

/** isValidBuilding()
 * this validates whether the building object named by _building is
 * actually a null pointer - if the calling program performs this check
 * directly there will be no need to call this validation method
 * included her only as an example of how to handle a null pointer
 */
    public static String isValidBuildingID(Building _building)
                                                throws Exception
    {
        try
        {
            String tempBuildingID = _building.getBuildingID();
            return tempBuildingID;
        } // end try
        catch (NullPointerException npe)
        {
            Exception e =
                new Exception("_building.getBuildingID() threw" +
                        " NullPointerException with message:\n" +
                                                    npe.getMessage());
            throw e;
        } // end npe catch - useful to identify catch argument since
		  // a try block can be followed by several catch blocks
		  
    } // end isValidBuilding()
    
} // class Building
