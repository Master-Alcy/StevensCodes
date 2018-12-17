package test;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

// Separating the task from the thread is a preferred design.
// assign null to thread to stop
// thread.yeild() => temporarily release time for other threads
// thread.sleep(long millis) puts the thread to sleep for a
// specified time in milliseconds to allow other threads to execute
// thread.join() force one thread to wait for another thread to finish

public class FlashText extends Application {

	public static void main(String[] args) {
		FlashText.launch();
	}

	private String text = "";

	@Override
	public void start(Stage primaryStage) {
		StackPane pane = new StackPane();
		Label lblText = new Label("Programming is fun");
		pane.getChildren().add(lblText);

		new Thread(() -> {
			try {
				while (true) {
					if (lblText.getText().trim().length() == 0) {
						text = "Welcome";
					} else {
						text = "";
					}
					Platform.runLater(() -> lblText.setText(text));
					Thread.sleep(200);
				}
			} catch (InterruptedException ex) {
			}

		}).start();

		// Create scene and place it in the stage
		Scene scene = new Scene(pane, 200, 50);
		primaryStage.setTitle("FlashText");
		primaryStage.setScene(scene);
		primaryStage.show();
	}
}