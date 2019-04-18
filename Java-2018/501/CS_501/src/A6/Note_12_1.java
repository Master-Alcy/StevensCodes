package A6;

import java.io.IOException;
import java.util.Scanner;

public class Note_12_1 {

	@SuppressWarnings("unused")
	public Note_12_1() {
		try {
			switch ((int) Math.random()) {
			case 0:
				throw new ClassNotFoundException("1");
			case 1:
				throw new IOException("2");
			}
		} catch (RuntimeException ex) { // Invoke before exception
			throw ex; // Exception can be re throw
			// To inform caller or want caller to handle this
		} catch (ClassNotFoundException | IOException err) {
			// Handle multi exceptions
		} catch (Exception ex) {
			ex.printStackTrace();
			String msg = ex.getMessage();
			String fullMsg = ex.toString();
			StackTraceElement[] traceElements = ex.getStackTrace();
			for (int i = 0; i < traceElements.length; i++) {
				System.out.print("method " + traceElements[i].getMethodName());
				System.out.print("(" + traceElements[i].getClassName() + ":");
				System.out.println(traceElements[i].getLineNumber() + ")");
			}
		} finally {
			// This is always executed even with error not caught
			// The un-caught error is passed to caller after finally{}
			// With finally, catch is not necessary
		}
	}

	@SuppressWarnings({ "resource", "unused" })
	public static void main(String[] args) throws Exception {
		try {
			throw new InvalidRadiusExcepton(1);
		} catch (InvalidRadiusExcepton e) {
			e.printStackTrace();
		}
		try {
			method1();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		// About file
		java.io.File file = new java.io.File("scores.txt");
		if (file.exists()) {
			System.out.println("File already exists");
			System.exit(0);
		}
		try (java.io.PrintWriter output = new java.io.PrintWriter(file)) {
			output.print("John T Smith ");
			output.println(90);
			output.print("Eric K Jones ");
			output.println(85);
		}
		// For Scanner: By default, the delimiters are whitespace characters
		Scanner sc = new Scanner(file);
		String lineSeparator = System.getProperty("line.separator");
		sc.useDelimiter(" ");
	}

	private static void method1() throws Exception {
		try {
			method2();
		} catch (Exception ex) {
			throw new Exception("\nFrom method1. " + ex);
		}
	}

	private static void method2() throws Exception {
		throw new Exception("\nFrom method2. ");
	}
}

class InvalidRadiusExcepton extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private double radius;

	public InvalidRadiusExcepton(double radius) {
		super("Invalid radius " + radius);
		setRadius(radius);
	}

	public double getRadius() {
		return radius;
	}

	public void setRadius(double radius) {
		this.radius = radius;
	}
}