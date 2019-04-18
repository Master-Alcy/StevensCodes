// DuplicateException.java
// Peter Jurkat
//
// MGT 331 (Spring 2007) Homework #3 Answer

/*
   DuplicateException is a class derived from Exception.  It adds no
   methods or data members, but provides a way of catching "duplicate"
   exceptions separately from other exception types.  A DuplicateException
   is thrown when an add() function cannot add new data to the data store
   because duplicate data is already stored there.
*/

package mypackage1;

public class DuplicateException extends Exception{

    public DuplicateException() {
    }
  public DuplicateException(String message)
  {
    super(message);
  }
}
