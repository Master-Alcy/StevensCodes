import java.io.IOException;
import java.net.ServerSocket;

public class Server {

	public static void main(String[] args) {
		StartServer();
	}

	public static void StartServer() {
		// Try with resources
		try (ServerSocket serverSocket = new ServerSocket(8000)) {
			while (true) {
				new ServerThread(serverSocket.accept()).start();
			}
		} catch (IOException ex) {
			System.out.println(ex.getStackTrace());
		}
	}
}