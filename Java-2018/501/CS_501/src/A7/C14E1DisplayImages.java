package A7;

import java.util.Arrays;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class C14E1DisplayImages extends Application{

	public static void main(String[] args) {
		System.out.println("Start with args: " + Arrays.toString(args));
		Application.launch(args);
		System.out.println("End with args: " +  Arrays.toString(args));
	}
	
	@Override
	public void start(Stage stage1) throws Exception{
		GridPane pane = new GridPane();
		pane.setAlignment(Pos.CENTER);
		pane.setPadding(new Insets(11.5, 12.5, 13.5, 14.5));
		pane.setHgap(5.5);
		pane.setVgap(5.5);
		
		Image img1 = new Image("England.jpg");
		Image img2 = new Image("Scotland.jpg");
		Image img3 = new Image("Wales.jpg");
		Image img4 = new Image("United_Kingdom.jpg");
		pane.add(new ImageView(img1), 0, 0);
		pane.add(new ImageView(img2), 1, 0);
		pane.add(new ImageView(img3), 0, 1);
		pane.add(new ImageView(img4), 1, 1);
		
		Scene scene = new Scene(pane);
		stage1.setTitle("ShowGridPane");
		stage1.setScene(scene);
		stage1.show();
	}

}
