/** TestBuilding.java
 * @author Peter Jurkat
 * pjurkat@unm.edu
 * 
 * Homework1StartingPoint example test class for the Building class
 * Spring 2009
 */

package mypackage1;

public class TestBuilding
{
	public TestBuilding() {
	} // end default constructor - not used - left here from Class
		// creation by JDeveloper

	public static void main(String[] args) {
//		TestBuilding testBuilding = new TestBuilding();
        run();  // this line runs the test function if this object is
	} // end main()
	
	public static void run()
	{
		System.out.println("");
		
		// declare test variables
		String testBuildingID = "";
		int testNumberOfFloors = 1;
		boolean testBasementFlag = false;
		
		// arrays of good and bad parameter values
		String testGoodBuildingIDs [] = {"ASM"};
		String testBadBuildingIDs [] = {"ASMM", "AS", "aSM", "AsM",
										"ASm", "1AM", "A2M", "AS3",
										"@SM", "A#M", "AS$"};
		int testGoodNumberOfFloors [] = { 1, 100};
		int testBadNumberOfFloors [] = { -1, -17};
		boolean testGoodBasementFlags [] = {true, false};
		// no bad booleans
		
		// test default constructor
		System.out.println("/nTesting default Building constructor");
		Building asm = new Building();
		printBuilding(asm);
		
		// test mutator functions with good data
		System.out.println("\nTesting mutator functions w/ good data");
		System.out.println("all calls should return true");
		
		// test setBuildingID() w/ good data
		// set up loop through good buildingIDs
		for(String element: testGoodBuildingIDs) {
			testBuildingID = element;
			System.out.print(
					"setBuildingID(\"" + testBuildingID + "\")");
			// set up try-catch blook for setBuildingID()
			try{
				asm.setBuildingID(testBuildingID);
				// if get here then setBuildingID()
				// did not throw Exception so say so
				System.out.println(" - passed");
			} // end try
			catch(Exception e) {
				// if get here then setBuildingID() threw Exception e
				System.out.println(" - failed" +
						"\nasm.setBuildingID(testBuildingID" +
						" threw Exception w/ message:\n" +
						asm.getErrorMessage());
			} // end e catch
			// check if buildingID was set to testBuildingID
			if( !asm.getBuildingID().equals(testBuildingID))
            {
                // if get here then set() did not work
				System.out.print("Data member should be " +
						testBuildingID);
                System.out.print(" but is actually " +
						asm.getBuildingID());
                System.out.print(" - accessor or mutator function is" +
						" malfunctioning");
                System.out.println(" - *** FAILED ***");
            } // end if( !sub...)
            System.out.println("");
		} // end for( ... element ...
		
		// test setNumberOfFloors() w/ good data
		// set up loop through good numberOfFloors
		for(int element: testGoodNumberOfFloors) {
			testNumberOfFloors = element;
			System.out.print(
					"setNumberOfFloors(\"" + testNumberOfFloors + "\")");
			// set up try-catch blook for setNumberOfFloors()
			try{
				asm.setNumberOfFloors(testNumberOfFloors);
				// if get here then setNumberOfFloors()
				// did not throw Exception so say so
				System.out.println(" - passed");
			} // end try
			catch(Exception e) {
				// if get here then setNumberOfFloors() threw Exception e
				System.out.println(" - failed" +
						"\nasm.setNumberOfFloors(testNumberOfFloors" +
						" threw Exception w/ message:\n" +
						asm.getErrorMessage());
			} // end e catch
			// check if buildingID was set to testNumberOfFloors
			if( asm.getNumberOfFloors() != (testNumberOfFloors))
            {
                // if get here then set() did not work
				System.out.print("Data member should be " +
						testNumberOfFloors);
                System.out.print(" but is actually " +
						asm.getNumberOfFloors());
                System.out.print(" - accessor or mutator function is" +
						" malfunctioning");
                System.out.println(" - *** FAILED ***");
            } // end if( !sub...)
            System.out.println("");
		} // end for( ... element ...
		
		// test setBasementFlag() w/ good data
		// set up loop through good basementFlags
		for(boolean element: testGoodBasementFlags) {
			testBasementFlag = element;
			System.out.print(
					"setBasementFlag(\"" + testBasementFlag + "\")");
			// set up try-catch blook for setBasementFlag()
			try{
				asm.setBasementFlag(testBasementFlag);
				// if get here then setBasementFlag()
				// did not throw Exception so say so
				System.out.println(" - passed");
			} // end try
			catch(Exception e) {
				// if get here then setBasementFlag() threw Exception e
				System.out.println(" - failed" +
						"\nasm.setBasementFlag(testBasementFlag" +
						" threw Exception w/ message:\n" +
						asm.getErrorMessage());
			} // end e catch
			// check if buildingID was set to testBasementFlag
			if( asm.getBasementFlag() != (testBasementFlag))
            {
                // if get here then set() did not work
				System.out.print("Data member should be " +
						testBasementFlag);
                System.out.print(" but is actually " +
						asm.getBasementFlag());
                System.out.print(" - accessor or mutator function is" +
						" malfunctioning");
                System.out.println(" - *** FAILED ***");
            } // end if( !sub...)
            System.out.println("");
		} // end for( ... element ...
		
        // print object content to see if data updates were applied
        // first use printBuilding() method in this test program whose
		// output can then be compared to the print() function in
		// Building to test it
        System.out.println("Building asm contents ...");
        printBuilding(asm);
             
        // test print() functions
        System.out.println("\nTesting print() and toString() function");
        asm.print();
		// compare the output of this print() function to that of the 
		// previous printBuilding() function
		
		// test equals() method directly
		System.out.println("direct call to toString() = " +
				asm.toString());
		// test implied equals() method
		System.out.println("implied use of toString() = " + asm);
             
		// test fpzc
		System.out.println("\ntesting fpzc");
		Building jonesBuilding = null;
		try{
			jonesBuilding = new Building("JON", 7, true);
			// if get here fpzc executed without Exception
			printBuilding(jonesBuilding);
		} // end try
		catch(Exception e) {
			// if get here fpzc threw Exception
			System.out.println("jonesBuilding constructor threw" +
					" Exception w/ message: " + e.getMessage());
			System.exit(371);
		} // end e catch
		
		// test equals()
		System.out.println("\ntesting equals() function");
		Building asmcopy = null;
		// make a copy of asm
		try{
			asmcopy = new Building(
							asm.getBuildingID(),
							asm.getNumberOfFloors(),
							asm.getBasementFlag());
		} // end try
		catch(Exception e) {
			// if get here Building constructor failed
			System.out.println("asmcopy constructor" +
					" threw Exception w/ message = " + e.getMessage());
			System.exit(341);
		} // end e catch
		
		// if get here than constructor was successful
		if(asmcopy.equals(asm))
			System.out.println(".equals() test passed");
		else System.out.println(".equals test failed");
		
		// test !.equals
		// change one of the Building parameter value
		try{
			asm.setNumberOfFloors(4);
		} // end try
		catch(Exception e) {
			// if get here set() function failed
			System.out.println("setCountry(Canada) threw Exception" +
					" w/ message = " + e.getMessage());
		} // end e catch
		// if get here set() succeeded
		if(!asmcopy.equals(asm))
			System.out.println("!.equals() test passed");
		else System.out.println("!.equals test failed");
		asm.print();
		
         // test mutator functions with bad data
        System.out.print("\nTesting mutator functions with bad data");
        System.out.println(
                " - should return passed and print error message");
        System.out.println("");
        
        // test setBuildingID() with bad data
        String currentBuildingID = jonesBuilding.getBuildingID();
		// initage for loop to run through bad buildingIDs
        for(String element: testBadBuildingIDs)
        {
            testBuildingID = element;
			System.out.print("setBuildingID(\"" +
					testBuildingID + "\")");
            // try setBuildingID() w/ bad data - should throuw exception
			try{
				jonesBuilding.setBuildingID(
						testBuildingID);
				// if get here setBuildingID set bad data
				System.out.println(" returned normally - ***FAILED***");				
			} // end try
			catch(Exception e) {
				// if get here then setBuildingID() correctly threw an
				// Exception
				System.out.println(" threw an exception - passed");
                System.out.println("message = " +
						jonesBuilding.getErrorMessage());
			} // end e catch
            // check to make sure no bad data was set in spite of
			// Exception
            if ( !jonesBuilding.getBuildingID().
					equals(currentBuildingID))
            {
                System.out.print("data member should be " +
                         currentBuildingID + " but is actually " +
                         jonesBuilding.getBuildingID());
                System.out.print(
                 " - accessor or mutator function is malfunctioning");
                System.out.println(" - *** FAILED ***");
            } // end if
            System.out.println("");
        } // end for(... element ...
    
        // test setNumberOfFloors() with bad data
		// see above for block for comments
        int currentNumberOfFloors =
				jonesBuilding.getNumberOfFloors();
        for(int element: testBadNumberOfFloors)
        {
            testNumberOfFloors = element;
			System.out.print("setNumberOfFloors(\"" +
					testNumberOfFloors + "\")");
            try{
				jonesBuilding.setNumberOfFloors(
						testNumberOfFloors);
				System.out.println(" returned normally - ***FAILED***");				
			} // end try
			catch(Exception e) {
				System.out.println(" threw an exception - passed");
                System.out.println("message = " +
						jonesBuilding.getErrorMessage());
			} // end e catch
            // check for correct data member update (or lack thereof)
            if ( jonesBuilding.getNumberOfFloors()
					!= currentNumberOfFloors)
            {
                System.out.print("data member should be " +
                         currentNumberOfFloors +
                         " but is actually " +
                         jonesBuilding.getNumberOfFloors());
                System.out.print(
                 " - accessor or mutator function is malfunctioning");
                System.out.println(" - *** FAILED ***");
            } // end if
            System.out.println("");
        } // end for(... element ...
		
		System.out.println("no need to test with bad basementFlag" +
				" which can only be true or false");
    
} // end run()
	
	public static void printBuilding(Building b)
	{
		System.out.println("");
		
		// check for null input argument
		if( b == null) {
			System.out.println("Building object reference is null !! ");
			return;
		} // end null check
		
		// retrieve class name
		String className = b.getClass().getName();
		
		System.out.println(className + ".buildingID = " +
				b.getBuildingID());
		System.out.println(className + ".numberOfFloors = " +
				b.getNumberOfFloors());
		System.out.println(className + ".basementFlag = " +
				b.getBasementFlag());

	} // end printBuilding()
	
} // end TestBuilding class
