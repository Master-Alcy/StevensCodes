package A7;

import java.util.Calendar;
import java.util.GregorianCalendar;

import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Line;
import javafx.scene.text.Text;

public class ClockPane extends Pane{
	private int hour;
	private int minute;
	private int second;	
	private double w = 250, h = 250;
	
	public ClockPane() {
		setCurrentTime();
		this.setW(250);
		this.setH(250);
		paintClock();
	}
	
	private void setCurrentTime() {
		Calendar cal = new GregorianCalendar();
		this.setHour(cal.get(Calendar.HOUR_OF_DAY));
		this.setMinute(cal.get(Calendar.MINUTE));
		this.setSecond(cal.get(Calendar.SECOND));
	}

	public ClockPane(int hour, int minute, int second,double w, double h) {
		this.setHour(hour);
		this.setMinute(minute);
		this.setSecond(second);
		this.setW(w);
		this.setH(h);
		paintClock();
	}

	private int getHour() {
		return hour;
	}

	private void setHour(int hour) {
		this.hour = hour;
		paintClock();
	}

	private int getMinute() {
		return minute;
	}

	private void setMinute(int minute) {
		this.minute = minute;
		paintClock();
	}

	private int getSecond() {
		return second;
	}

	private void setSecond(int second) {
		this.second = second;
		paintClock();
	}

	private double getW() {
		return w;
	}

	private void setW(double w) {
		this.w = w;
		paintClock();
	}

	private double getH() {
		return h;
	}

	private void setH(double h) {
		this.h = h;
		paintClock();
	}

	private void paintClock() {
		double clockRadius = Math.min(getW(), getH()) * 0.8 * 0.5;
		double centerX = getW() / 2;
		double centerY = getH() / 2;
		// Draw circle
		Circle circle = new Circle(centerX, centerY, clockRadius);
		circle.setFill(Color.ANTIQUEWHITE);
		circle.setStroke(Color.BLANCHEDALMOND);
		Text t1 = new Text(centerX - 5, centerY - clockRadius + 12, "12");
		Text t2 = new Text(centerX - clockRadius + 3, centerY + 5, "9");
		Text t3 = new Text(centerX + clockRadius - 10, centerY + 3, "3");
		Text t4 = new Text(centerX - 3, centerY + clockRadius - 3, "6");
		// Draw second hand
		double sLength = clockRadius * 0.8;
		double secondX = centerX + sLength *
		Math.sin(getSecond() * (2 * Math.PI / 60));
		double secondY = centerY - sLength *
		Math.cos(getSecond() * (2 * Math.PI / 60));
		Line sLine = new Line(centerX, centerY, secondX, secondY);
		sLine.setStroke(Color.RED);
		// Draw minute hand
		double mLength = clockRadius * 0.65;
		double xMinute = centerX + mLength *
		Math.sin(getMinute() * (2 * Math.PI / 60));
		double minuteY = centerY - mLength *
		Math.cos(getMinute() * (2 * Math.PI / 60));
		Line mLine = new Line(centerX, centerY, xMinute, minuteY);
		mLine.setStroke(Color.BLUE);
		// Draw hour hand
		double hLength = clockRadius * 0.5;
		double hourX = centerX + hLength *
		Math.sin((getHour() % 12 + getMinute() / 60.0) * (2 * Math.PI / 12));
		double hourY = centerY - hLength *
		Math.cos((getHour() % 12 + getMinute() / 60.0) * (2 * Math.PI / 12));
		Line hLine = new Line(centerX, centerY, hourX, hourY);
		hLine.setStroke(Color.GREEN);
		
		getChildren().clear();
		getChildren().addAll(circle,t1,t2,t3,t4,sLine,mLine,hLine);
	}

}
