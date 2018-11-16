/**
 * This is the personal geometic object class
 * 
 * @version 1.0, 2018/11/04
 * @author Jingxuan Ai
 * @since 1.0
 */
public class C11E1GeometricObject {
	private boolean isFilled;
	private String color;

	public C11E1GeometricObject() {
	}

	public C11E1GeometricObject(String color, boolean isFilled) {
		setColor(color);
		setFilled(isFilled);
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public boolean isFilled() {
		return isFilled;
	}

	public void setFilled(boolean isFilled) {
		this.isFilled = isFilled;
	}
	
	public String toString(){
		return "This C11E1GeometricObject has color: " + getColor()
				+ " and filled: " + isFilled();
	}

}
