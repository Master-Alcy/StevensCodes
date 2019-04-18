import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {

	public static void main(String[] args) {
		StartClient();
	}

	public static void StartClient() {
		try (Socket serverSocket = new Socket("localhost", 8000);
				PrintWriter pw = new PrintWriter(serverSocket.getOutputStream(), true);
				BufferedReader stream = new BufferedReader(new InputStreamReader(serverSocket.getInputStream()));
				BufferedReader write = new BufferedReader(new InputStreamReader(System.in))) {
			System.out.println("In Client, write company's symbol to get its data. Enter 'bye' to exit.");
			System.out.println("You only need to input here");
			String toServer;

			outer: while ((toServer = write.readLine()) != null) {
				pw.println(toServer);
				if (toServer.equals("bye"))
					break outer;
				String line;
				
				while (!(line = stream.readLine()).equals("END")) {
					System.out.println(line);
				}
				System.out.println("End of data. Another symbol for more or 'bye' to exit.");
			}
		} catch (IOException e) {
			System.err.println("Exception: " + e);
		}
	}
}