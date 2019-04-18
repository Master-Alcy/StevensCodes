import javax.swing.JOptionPane;
public class PasswordBlank {
		
	public static void main(String[] args){
		int option=JOptionPane.YES_OPTION;
		while(option==JOptionPane.YES_OPTION){
			try{
				String password=JOptionPane.showInputDialog(
						"Enter a Password: Must be 8 or more" +
						" letters or numerical digits 2" +
						" of which must be digits");
				isValidPassword(password);
				option=JOptionPane.showConfirmDialog(null,
					"Valid Password"+"\nDo you want to continue");
				} // end try
			catch(Exception ex){
				String outputStr = " Invalid Password: " + 
						ex.getMessage() + 
						"\nDo you want to continue? ";
				option = JOptionPane.showConfirmDialog(null, outputStr);
			} // end catch
		} // end while
	} // end main()

	   private static void isValidPassword(String str)throws Exception{
		   // enter code to check password requirements
	   
	   }// end isValidPassword

} // end class PasswordBlank
