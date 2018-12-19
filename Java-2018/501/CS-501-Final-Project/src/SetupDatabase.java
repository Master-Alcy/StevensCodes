import java.util.Scanner;

public class SetupDatabase {

	public static void main(String[] args) {
		Asker1();
		ptln("DataBase and tables created. Please open Server and Client respectively.");
	}

	/** The purpose of this method is initiate database */
	private static void Asker1() {
		Scanner sc = new Scanner(System.in);
		ptln("This program is developed with MySQL8 at 2018/12\n" + "This Step is to initialize the database\n"
				+ "The default JDBC driver is: com.mysql.cj.jdbc.Driver\n"
				+ "The default database url is: jdbc:mysql://localhost:3306/\n" + "The default user is: root\n"
				+ "For Password, you have to enter yours for root as default");

		Asker1: while (true) {
			try {
				ptln("Your driver (In one line): ");
				String JDBC = sc.nextLine();
				ptln("Your DB_URL (In one line): ");
				String DB_URL = sc.nextLine();
				ptln("Your user (tested with root): ");
				String user = sc.nextLine();
				ptln("Your password (tested with root password: ");
				String pass = sc.nextLine();
				DataBase.UserCreateTable(JDBC, DB_URL, user, pass);
				// Should set up server here
				sc.close();
				break Asker1;
			} catch (Exception ex) {
				ptln("Caught some error: " + ex);
				ptln("Re-Entering asking loop");
				continue Asker1;
			}
		}
	}

	/** my personal printer */
	private static void ptln(Object str) {
		try {
			System.out.println(str + "");
		} catch (Exception e) {
			System.out.println("Error. Wrong Print Type.");
			e.printStackTrace();
			return;
		}
	}
}