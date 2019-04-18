package A7;

import java.util.Arrays;

import javafx.application.Application;
import javafx.collections.ObservableList;
import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Line;
import javafx.scene.shape.Polygon;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.scene.text.FontPosture;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;
import javafx.stage.Stage;

@SuppressWarnings("unused")
public class MyJavaFX extends Application {
	
	public static void main(String[] args) {
		System.out.println(Arrays.toString(args));
		Application.launch(args);
		System.out.println("END");
	}

	@Override // This method was in Application class
	public void start(Stage primaryStage) throws Exception {
		//>>> Basic Stage
		//StageOne(primaryStage);
		//>>> Dual Stage
		//StageTwo();
		//>>> Pane
		//StageThree();
		//>>> Stage > Scene > (Parent) > Control == Pane > 
		//>>> PaneLayouts == (Node) > Shape == ImageView
		//StageFour();
		//>>> ShowCircleCentered
		//StageFive();
		//>>> Rotate Style Property is defined with prefix -fx-
		//StageSix();
		//>>> Test Font
		//StageSeven();
		//>>> Show Image
		//StageEight();
		//>>> FlowPane : horizontally/vertically
		StageNine();
		//>>> GridPane
		//StageTen();
		//>>> BorderPane
		//StageEleven();
		//>>> HBox and VBox
		//StageTwelve();
		//>>> Shapes: Text
		StageThirteen();
		//>>> Shapes: Line
		//StageFourteen();
		//>>> Shapes: Rectangle
		StageFifteen();
		//>>> Shapes: Circle, Ellipse
		//Ellipse(centerX, centerY,radiusX, radiusY)
		//>>> Shapes: Arc
		//Arc(centerX, centerY, radiusX,radiusY, startAngle, length)
		//ArcType: ROUND, OPEN, CHORD
		//new Arc(x, y, radiusX, radiusY, -30, -20);
		//>>> Shapes: Polygon
		//StageSixteen();
		// Test clock
		clock();
	}

	private void clock() {
		ClockPane clock1 = new ClockPane();
		ClockPane clock2 = new ClockPane(1,2,3,400,400);
		Stage stage = new Stage();
		FlowPane rootPane = new FlowPane();
		rootPane.getChildren().addAll(clock1,clock2);
		Scene scene = new Scene(rootPane, 300, 300);
		stage.setTitle("Clock"); // Set the stage title
		stage.setScene(scene); // Place the scene in the stage
		stage.show(); // Display the stage	
	}

	private void StageSixteen() {
		Pane pane = new Pane();
		Polygon polygon = new Polygon();
		pane.getChildren().add(polygon);
		polygon.setFill(Color.WHITE);
		polygon.setStroke(Color.BLACK);
		ObservableList<Double> list = polygon.getPoints();

		final double WIDTH = 200, HEIGHT = 200;
		double centerX = WIDTH / 2, centerY = HEIGHT / 2;
		double radius = Math.min(WIDTH, HEIGHT) * 0.4;

		// Add points to the polygon list
		for (int i = 0; i < 6; i++) {
			list.add(centerX + radius * Math.cos(2 * i * Math.PI / 6));
			list.add(centerY - radius * Math.sin(2 * i * Math.PI / 6));
		}

		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane, WIDTH, HEIGHT);
		primaryStage.setTitle("ShowPolygon"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private void StageFifteen() {
		Pane pane = new Pane();
		// Create rectangles and add to pane
		Rectangle r1 = new Rectangle(25, 10, 60, 30);
		r1.setStroke(Color.BLACK);
		r1.setFill(Color.WHITE);
		pane.getChildren().add(new Text(10, 27, "r1"));
		pane.getChildren().add(r1);

		Rectangle r2 = new Rectangle(25, 50, 60, 30);
		pane.getChildren().add(new Text(10, 67, "r2"));
		pane.getChildren().add(r2);

		Rectangle r3 = new Rectangle(25, 90, 60, 30);
		r3.setArcWidth(15);
		r3.setArcHeight(25);
		pane.getChildren().add(new Text(10, 107, "r3"));
		pane.getChildren().add(r3);

		for (int i = 0; i < 4; i++) {
			Rectangle r = new Rectangle(100, 50, 100, 30);
			r.setRotate(i * 360 / 8);
			r.setStroke(Color.color(Math.random(), Math.random(), Math.random()));
			r.setFill(Color.WHITE);
			pane.getChildren().add(r);
		}
		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane, 250, 150);
		primaryStage.setTitle("ShowRectangle"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private void StageFourteen() {
		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(new LinePane(),200,200);
		primaryStage.setTitle("ShowLine"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}
	
	private class LinePane extends Pane {
		public LinePane() {
			Line line1 = new Line(10,10,10,10);
			line1.endXProperty().bind(widthProperty().subtract(10));
			line1.endYProperty().bind(heightProperty().subtract(10));
			line1.setStrokeWidth(5);
			line1.setStroke(Color.GREEN);
			getChildren().add(line1);
			
			Line line2 = new Line(10, 10, 10, 10);
			line2.startXProperty().bind(widthProperty().subtract(10));
			line2.endYProperty().bind(heightProperty().subtract(10));
			line2.setStrokeWidth(5);
			line2.setStroke(Color.YELLOW);
			getChildren().add(line2);
			
			Line line3 = new Line(10, 10, 10, 10);
			line3.startXProperty().bind(widthProperty().divide(2));
			line3.endXProperty().bind(widthProperty().divide(2));
			line3.endYProperty().bind(heightProperty().subtract(10));
			line3.setStrokeWidth(5);
			line3.setStroke(Color.RED);
			getChildren().add(line3);
			
			Line line4 = new Line(10, 10, 10, 10);
			line4.startYProperty().bind(heightProperty().divide(2));
			line4.endXProperty().bind(widthProperty().subtract(10));
			line4.endYProperty().bind(heightProperty().divide(2));
			line4.setStrokeWidth(5);
			line4.setStroke(Color.BLUE);
			getChildren().add(line4);
		}
	}

	private void StageThirteen() {
		// Create a pane to hold the texts
		Pane pane = new Pane();
		pane.setPadding(new Insets(5, 5, 5, 5));
		Text text1 = new Text(20, 20, "Programming is fun1");
		text1.setFont(Font.font("Courier", FontWeight.BOLD, FontPosture.ITALIC, 15));
		pane.getChildren().add(text1);

		Text text2 = new Text(60, 60, "Programming is fun\nDisplay text2");
		pane.getChildren().add(text2);

		Text text3 = new Text(10, 100, "Programming is fun\nDisplay text3");
		text3.setFill(Color.RED);
		text3.setUnderline(true);
		text3.setStrikethrough(true);
		pane.getChildren().add(text3);

		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane);
		primaryStage.setTitle("ShowText"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private void StageTwelve() {
		// Create a border pane
		BorderPane pane = new BorderPane();
		// Place nodes in the pane
		pane.setTop(getHBox());
		pane.setLeft(getVBox());
		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane);
		primaryStage.setTitle("ShowHBoxVBox"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private HBox getHBox() {
		HBox hBox = new HBox(15);
		hBox.setPadding(new Insets(15, 15, 15, 15));
		hBox.setStyle("-fx-background-color: gold");
		hBox.getChildren().add(new Button("Computer Science"));
		hBox.getChildren().add(new Button("Chemistry"));
		ImageView imageView = new ImageView(new Image("REL.gif"));
		hBox.getChildren().add(imageView);
		return hBox;
	}

	private VBox getVBox() {
		VBox vBox = new VBox(15);
		vBox.setPadding(new Insets(15, 5, 5, 5));
		vBox.getChildren().add(new Label("Courses"));
		Label[] courses = { new Label("CSCI 1301"), new Label("CSCI 1302"), new Label("CSCI 2410"),
				new Label("CSCI 3720") };
		for (Label course : courses) {
			// set nodes' margin
			VBox.setMargin(course, new Insets(0, 0, 0, 15));
			vBox.getChildren().add(course);
		}
		return vBox;
	}

	private void StageEleven() {
		BorderPane pane = new BorderPane();
		// Place nodes in the pane
		pane.setTop(new CustomPane("Top"));
		pane.setRight(new CustomPane("Right"));
		pane.setBottom(new CustomPane("Bottom"));
		pane.setLeft(new CustomPane("Left"));
		pane.setCenter(new CustomPane("Center"));
		// Create a scene and place it in the stage
		Scene scene = new Scene(pane);
		Stage primaryStage = new Stage();
		primaryStage.setTitle("ShowBorderPane"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}
	
	// Define a custom pane to hold a label in the center of the pane
	private class CustomPane extends StackPane {
		public CustomPane(String title) {
			getChildren().add(new Label(title));
			setStyle("-fx-border-color: red");
			setPadding(new Insets(11.5, 12.5, 13.5, 14.5));
		}
	}

	private void StageTen() {
		GridPane pane = new GridPane();
		pane.setAlignment(Pos.CENTER);
		pane.setPadding(new Insets(11.5, 12.5, 13.5, 14.5));
		pane.setHgap(5.5);
		pane.setVgap(5.5);

		// Place nodes in the pane
		pane.add(new Label("First Name:"), 0, 0);
		pane.add(new TextField(), 1, 0);
		pane.add(new Label("MI:"), 0, 1);
		pane.add(new TextField(), 1, 1);
		pane.add(new Label("Last Name:"), 0, 2);
		pane.add(new TextField(), 1, 2);
		Button btAdd = new Button("Add Name");
		pane.add(btAdd, 1, 3);
		GridPane.setHalignment(btAdd, HPos.RIGHT);

		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane);
		primaryStage.setTitle("ShowGridPane"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private void StageNine() {
		FlowPane pane = new FlowPane();
		pane.setPadding(new Insets(11, 12, 13, 14));
		pane.setHgap(5);
		pane.setVgap(5);

		// Place nodes in the pane
		pane.getChildren().addAll(new Label("First Name:"), new TextField(), new Label("MI:"));
		TextField tfMi = new TextField();
		tfMi.setPrefColumnCount(2);
		pane.getChildren().addAll(tfMi, new Label("Last Name:"), new TextField());

		// Create a scene and place it in the stage
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane, 200, 250);
		primaryStage .setTitle("ShowFlowPane"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private void StageEight() {
		Pane pane = new HBox(10);
		pane.setPadding(new Insets(5,5,5,5));
		Image image = new Image("REL.gif");
		pane.getChildren().add(new ImageView(image));
		
		ImageView imgV = new ImageView("REL.gif");
		imgV.setFitHeight(100);
		imgV.setFitWidth(100);
		pane.getChildren().add(imgV);
		
		ImageView imgV2 = new ImageView(image);
		imgV2.setRotate(90);
		pane.getChildren().add(imgV2);
		
		Stage stage = new Stage();
		Scene scene = new Scene(pane);
		stage.setTitle("ShowImage");
		stage.setScene(scene);
		stage.show();
	}

	private void StageSeven() {
		// StackPane auto places nodes in center
		Pane pane = new StackPane();
		Circle circle = new Circle();
		circle.setRadius(50);
		circle.setStroke(Color.BLACK);
		circle.setFill(new Color(0.5, 0.5, 0.5, 0.1));
		//pane.getChildren().add(circle);
		// Create Label
		Label label = new Label("JavaFX");
		label.setFont(Font.font("Times New Roman",
		FontWeight.BOLD, FontPosture.ITALIC, 20));
		//pane.getChildren().add(label);
		pane.getChildren().addAll(circle,label);
		
		Stage stage = new Stage();
		Scene scene = new Scene(pane);
		stage.setTitle("FontDemo");
		stage.setScene(scene);
		stage.show();
	}

	private void StageSix() {
		//Color color = new Color(1,1,1,1);
		StackPane pane = new StackPane();
		Button btOK = new Button("OK");
		btOK.setStyle("-fx-border-color: blue;");
		pane.getChildren().add(btOK);

		pane.setRotate(45);
		pane.setStyle("-fx-border-color: RED; -fx-background-color: WHITE;");
		
		Stage primaryStage = new Stage();
		Scene scene = new Scene(pane, 200, 250);
		primaryStage.setTitle("NodeStyleRotateDemo"); // Set the stage title
		primaryStage.setScene(scene); // Place the scene in the stage
		primaryStage.show(); // Display the stage
	}

	private void StageFive() {
		Pane pane = new Pane();
		Circle circle = new Circle();
		// Note that "bind" is very useful
		circle.centerXProperty().bind(pane.widthProperty().divide(2));
		circle.centerYProperty().bind(pane.heightProperty().divide(2));
		circle.setRadius(50);
		circle.setStyle("-fx-stroke: BLUE; -fx-fill: red;");
		//circle.setStroke(Color.BLUE);
		//circle.setFill(Color.RED);
		pane.getChildren().add(circle);
		
		Stage stage = new Stage();
		Scene scene = new Scene(pane, 200, 200);
		stage.setTitle("ShowCircleCentered");
		stage.setScene(scene);
		stage.show();
	}

	private void StageFour() {
		// Pane with Node
		// Node with shape
		Circle circle = new Circle();
		circle.setCenterX(100);
		circle.setCenterY(100);
		circle.setRadius(50);
		circle.setStroke(Color.BLUE);
		circle.setFill(Color.RED);
		// Pane's Child is Node {Shape, ImageView}
		Pane pp = new Pane();
		pp.getChildren().add(circle);
		// Create scene and stage
		Stage ss = new Stage();
		Scene ssScene = new Scene(pp, 200, 200);
		ss.setTitle("ShowCircle");
		ss.setScene(ssScene);
		ss.show();
	}

	private void StageThree() {
		Stage BIPane = new Stage();
		StackPane pane = new StackPane();
		pane.getChildren().add(new Button("Another OK"));
		Scene BIScene = new Scene(pane, 200, 50);
		BIPane.setTitle("Button and Pane");
		BIPane.setScene(BIScene);
		BIPane.show();
	}

	private void StageTwo() {
		Stage stage = new Stage();
		stage.setTitle("Second Stage");
		stage.setScene(new Scene(new Button("New Stage"), 100, 100));
		stage.show();
	}

	private void StageOne(Stage primaryStage) {
		Button btOK = new Button("OK");
		Scene scene = new Scene(btOK, 200, 250);
		primaryStage.setTitle("MyJavaFX"); // Set Stage Title
		primaryStage.setScene(scene); // Place the Scene in Stage
		primaryStage.show(); // Display
	}

}
