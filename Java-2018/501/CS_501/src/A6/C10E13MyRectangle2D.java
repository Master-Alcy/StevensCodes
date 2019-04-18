package A6;

/**
 * This is the personal rectangle class
 * 
 * @version 1.0, 2018/11/04
 * @author Jingxuan Ai
 * @since 1.0
 */
public class C10E13MyRectangle2D {
	/**
	 * Data to describing this rectangle
	 * 
	 * @param x
	 *            ,y Center at x-axis and y-axis
	 * @param width
	 *            ,height Describe rectangle's shape
	 * @param leftEdge
	 *            ,rightEdge,topEdge,downEdge Describing rectangle edges'
	 *            position
	 */
	private double x, y, width, height;
	private double leftEdge, rightEdge, topEdge, bottomEdge;

	public double getX() {
		return x;
	}

	public double getY() {
		return y;
	}

	public double getWidth() {
		return width;
	}

	public double getHeight() {
		return height;
	}

	public double getLeftEdge() {
		return leftEdge;
	}

	public double getRightEdge() {
		return rightEdge;
	}

	public double getTopEdge() {
		return topEdge;
	}

	public double getBottomEdge() {
		return bottomEdge;
	}

	public void setX(double x) {
		this.x = x;
	}

	public void setY(double y) {
		this.y = y;
	}

	public void setWidth(double width) {
		this.width = width;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public void setLeftEdge(double leftEdge) {
		this.leftEdge = leftEdge;
	}

	public void setRightEdge(double rightEdge) {
		this.rightEdge = rightEdge;
	}

	public void setTopEdge(double topEdge) {
		this.topEdge = topEdge;
	}

	public void setBottomEdge(double bottomEdge) {
		this.bottomEdge = bottomEdge;
	}

	public C10E13MyRectangle2D() {
		setX(0);
		setY(0);
		setWidth(1);
		setHeight(1);
		setLeftEdge(-0.5);
		setRightEdge(0.5);
		setTopEdge(0.5);
		setBottomEdge(-0.5);
	}

	/** Width and Height need to be positive */
	public C10E13MyRectangle2D(double x, double y, double width, double height)
			throws Exception {
		if (width <= 0 || height <= 0) {
			throw new Exception("Width and Height should both be positive");
		}

		setX(x);
		setY(y);
		setWidth(width);
		setHeight(height);
		setLeftEdge(x - width / 2);
		setRightEdge(x + width / 2);
		setTopEdge(y + height / 2);
		setBottomEdge(y - height / 2);
	}

	public double getArea() {
		return getWidth() * getHeight();
	}

	public double getPerimeter() {
		return (getWidth() + getHeight()) * 2;
	}

	public boolean contains(double x, double y) {
		if (getLeftEdge() < x && x < getRightEdge() && getTopEdge() > y
				&& y > getBottomEdge()) {
			return true;
		}
		return false;
	}

	public boolean contains(C10E13MyRectangle2D r) {
		if (getLeftEdge() < r.getLeftEdge()
				&& getRightEdge() > r.getRightEdge()
				&& getTopEdge() > r.getTopEdge()
				&& getBottomEdge() < r.getBottomEdge()) {
			return true;
		}
		return false;
	}

	public boolean overlaps(C10E13MyRectangle2D r) {
		if (r.getBottomEdge() >= getTopEdge()
				|| r.getRightEdge() <= getLeftEdge()
				|| r.getLeftEdge() >= getRightEdge()
				|| r.getTopEdge() <= getBottomEdge()) {
			// Any of these four condition means distinct or abut
			return false;
		}
		return true;
	}

	/** Test if right next to each other */
	public boolean abut(C10E13MyRectangle2D r) {
		if (overlaps(r)||(distinct(r))) {
			// is overlap or distinct
			return false;
		} 
		return true;
	}

	public boolean distinct(C10E13MyRectangle2D r) {
		if (r.getBottomEdge() > getTopEdge()
				|| r.getRightEdge() < getLeftEdge()
				|| r.getLeftEdge() > getRightEdge()
				|| r.getTopEdge() < getBottomEdge()) {
			// Any of these four condition means distinct
			return true;
		}
		return false;
	}
}