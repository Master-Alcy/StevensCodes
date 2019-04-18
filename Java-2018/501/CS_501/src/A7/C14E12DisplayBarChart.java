package A7;

import java.util.Arrays;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class C14E12DisplayBarChart extends Application {

	public static void main(String[] args) {
		System.out.println("Start with args: " + Arrays.toString(args));
		Application.launch(args);
		System.out.println("End with args: " +  Arrays.toString(args));
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		BorderPane rootPane = new BorderPane();
		rootPane.setTop(new rectPane());
		rootPane.setBottom(new barPane());
		
		Scene scene= new Scene(rootPane, 700, 750);
		primaryStage.setTitle("Two Bar Charts");
		primaryStage.setScene(scene);
		primaryStage.show();
	}
	
	private class rectPane extends Pane {
		private final double width = 700;
		private final double height = 350;
		private final double rectWid = (width - 100) / 4.0;
		private final double gap = 100 / 5.0;
		
		// Text area is 50 height	
		private double getRectHeight(double percent) {
			percent = percent / 100.0;
			return (height - 50) * (1 / 0.4) * percent;
		}
		
		private rectPane() {
			Rectangle r1 = new Rectangle(
					gap
					, height - getRectHeight(20)
					, rectWid
					, getRectHeight(20));
			r1.setStroke(Color.BLACK);
			r1.setFill(Color.RED);
			Text t1 = new Text(
					gap
					, height - r1.getHeight() - 10, 
					"Project -- 20%");
			getChildren().addAll(t1,r1);
			
			Rectangle r2 = new Rectangle(
					gap * 2 + rectWid
					, height - getRectHeight(10)
					, rectWid
					, getRectHeight(10));
			r2.setStroke(Color.BLACK);
			r2.setFill(Color.BLUE);
			Text t2 = new Text(
					gap * 2 + rectWid
					, height - r2.getHeight() - 10, 
					"Quiz -- 10%");
			getChildren().addAll(t2,r2);
			
			Rectangle r3 = new Rectangle(
					gap * 3 + rectWid * 2
					, height - getRectHeight(30)
					, rectWid
					, getRectHeight(30));
			r3.setStroke(Color.BLACK);
			r3.setFill(Color.GREEN);
			Text t3 = new Text(
					gap * 3 + rectWid * 2
					, height - r3.getHeight() - 10, 
					"Midterm -- 30%");
			getChildren().addAll(t3,r3);
			
			Rectangle r4 = new Rectangle(
					gap * 4 + rectWid * 3
					, height - getRectHeight(40)
					, rectWid
					, getRectHeight(40));
			r4.setStroke(Color.BLACK);
			r4.setFill(Color.ORANGE);
			Text t4 = new Text(
					gap * 4 + rectWid * 3
					, height - r4.getHeight() - 10, 
					"Final -- 40%");
			getChildren().addAll(t4,r4);
		}
	}
	
	private class barPane extends Pane {
				
		private barPane() {
			CategoryAxis xAxis = new CategoryAxis();
			xAxis.setLabel("Grade Distrabution");
			
			NumberAxis yAxis = new NumberAxis();
			yAxis.setLabel("Percent");
			
			BarChart<String,Number> bc = 
		            new BarChart<>(xAxis,yAxis);
			bc.setCategoryGap(20);
			bc.setTitle("BarChar Approach");			
			
			XYChart.Series<String, Number> s1 = new XYChart.Series<>();
			s1.getData().add(new XYChart.Data<String, Number>
			("Project -- 20%", 20));
			s1.getData().add(new XYChart.Data<String, Number>
			("Quiz -- 10%", 10));
			s1.getData().add(new XYChart.Data<String, Number>
			("Midterm -- 30%", 30));
			s1.getData().add(new XYChart.Data<String, Number>
			("Final -- 40%", 40));
			
			bc.getData().add(s1);
			// .lookup pattern is of CSS
			bc.lookup(".data0.chart-bar").setStyle("-fx-bar-fill: red");
		    bc.lookup(".data1.chart-bar").setStyle("-fx-bar-fill: blue");
		    bc.lookup(".data2.chart-bar").setStyle("-fx-bar-fill: green");
		    bc.lookup(".data3.chart-bar").setStyle("-fx-bar-fill: orange");			
			bc.setLegendVisible(false);
			
			getChildren().clear();
			getChildren().add(bc);
		}
		
	}
	
}
