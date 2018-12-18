package test;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;

public class TestServer extends Application {
	// it is better to use binary I/O for transmitting data between a
	// server and a client to improve performance.
	public static void main(String[] args) {
		TestServer.launch();
	}

	@Override // Override the start method in the Application class
	public void start(Stage primaryStage) {
		// Text area for displaying contents
		TextArea ta = new TextArea();
		// Create a scene and place it in the stage
		Scene scene = new Scene(new ScrollPane(ta), 450, 200);
		primaryStage.setTitle("Server"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage

		new Thread(() -> {
			try {
				// Create a server socket
				@SuppressWarnings("resource")
				ServerSocket serverSocket = new ServerSocket(8000);
				Platform.runLater(() -> ta.appendText("Server started at " + new Date() + '\n'));
				// Listen for a connection request
				Socket socket = serverSocket.accept();
				// Create data input and output streams
				DataInputStream inputFromClient = new DataInputStream(socket.getInputStream());
				DataOutputStream outputToClient = new DataOutputStream(socket.getOutputStream());

				while (true) {
					// Receive radius from the client
					double radius = inputFromClient.readDouble();
					// Compute area
					double area = radius * radius * Math.PI;
					// Send area back to the client
					outputToClient.writeDouble(area);
					// Plateform.runLater is updating the GUI
					Platform.runLater(() -> {
						ta.appendText("Radius received from client: " + radius + '\n');
						ta.appendText("Area is: " + area + '\n');
					});
				}// End while loop
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}).start();
	}// End of start
}