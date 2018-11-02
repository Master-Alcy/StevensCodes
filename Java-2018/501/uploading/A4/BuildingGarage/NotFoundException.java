// NotFoundException.java
// Peter Jurkat
//
// MGT 331 (Spring 2007) Homework #3 Answer

package mypackage1;

/*
   NotFoundException is a class derived from Exception.  It adds no
   methods or data members, but provides a way of catching "not found"
   exceptions separately from other exception types.  A NotFoundException
   is thrown when a find() function cannot locate data in the database
   that matches the parameter(s) passed to the function.
*/

public class NotFoundException extends Exception
{
    public NotFoundException() {
    }
    
  public NotFoundException(String message)
  {
    super(message);
  }
}
