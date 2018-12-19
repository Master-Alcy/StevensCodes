import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.ArrayList;

public class ServerThread extends Thread {
	private Socket socket; // A connected socket

	public ServerThread(Socket s) {
		super("ServerThread");
		this.socket = s;
	}

	public void run() {
		try (PrintWriter pw = new PrintWriter(socket.getOutputStream(), true); // Try with resource
				BufferedReader stream = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {
			System.out.println("In Server");
			String fromClient;

			outer: while ((fromClient = stream.readLine()) != null) {
				System.out.println("Symbol from client: " + fromClient);
				if (fromClient.equals("bye"))
					break outer;

				// Query DataBase
				int resId = DataBase.UserCheckExist(fromClient);
				if (resId == 0) {
					// new symbol, call crawler
					QuotesCrawler.operateSymbol(fromClient);
					// added to database, renew id
					resId = DataBase.UserCheckExist(fromClient);
				} // After here should be valid id
				ArrayList<String[]> resList = DataBase.UserGetData(resId);

				// Transfer data back
				String data = resList.remove(0)[0] + "\n";
				data += "Date\t\tOpen\t\tHigh\t\tLow\t\tClose\t\tAdj_Close\t\tVolume\n";
				while (!resList.isEmpty()) {
					String[] aRow = resList.remove(0);
					data += aRow[0] + "\t" + aRow[1] + "\t\t" + aRow[2] + "\t\t" + aRow[3] + "\t\t" + aRow[4] + "\t\t"
							+ aRow[5] + "\t\t" + aRow[6] + "\n";
				}
				data += "END";
				System.out.println("End of inner loop.");
				pw.println(data);
			} // End of while loop
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		System.out.println("ServerThread End.");
	}
}