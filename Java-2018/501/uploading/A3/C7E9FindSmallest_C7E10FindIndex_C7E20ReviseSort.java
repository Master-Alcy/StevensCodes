import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author Jingxuan Ai
 * @author 10431517
 */
public class C7E9FindSmallest_C7E10FindIndex_C7E20ReviseSort {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ptln("Asker started.\n I'll first ask for 10 numbers as input,\n"
				+ "which is required in 7.9/7.10/7.20. Then I'll\n"
				+ "give the minimum number and its index as said in\n"
				+ "7.9/7.10. At last I'll show the array sorted with\n"
				+ "requirements in 7.20.");
		// other way to do asking loop
		Asker: while (true) {
			double[] arr = new double[10];
			ptln("Enter 10 non-negative numbers, "
					+ "seperated by space or new line: ");
			testCase: try {
				for (int i = 0; i < 10; i++) {
					arr[i] = sc.nextDouble();
					ptln("This is input: " + (i + 1));
				}
				ptln("The input array is:\n" + Arrays.toString(arr));
				if (!checkPositiveArray(arr)) {
					ptln("Please enter non-negative numbers only.");
					break testCase;
				}
				ptln("The minimum number is: " + min(arr));
				ptln("The minimum number's index is: "
						+ indexOfSmallestElement(arr));
				ptln("Note that index 0 is the 1st element and so on.");
				ptln("The result of revise Selection Sort is:\n"
						+ Arrays.toString(reviseSelectionSort(arr)));
			} catch (InputMismatchException e) {
				ptln("Need a valid double number." + e);
				sc.next(); // delete this token
			}
			// Continuer
			ptln("Enter 1 to continue, else to end.");
			try {
				if (sc.nextInt() != 1) {
					break Asker;
				}
			} catch (InputMismatchException e) {
				sc.next(); // delete this token in stream
				break Asker;
			}
		}
		sc.close();
		ptln("Asker ends.");
	}

	/** Question 7.20, Revise Sort */
	private static double[] reviseSelectionSort(double[] arr) {
		for (int tail = arr.length - 1; tail > 0; tail --){
			int maxIndex = maxIndexOfArray(arr, tail);
			swapArray(arr, maxIndex, tail);
		}
		return arr;
	}  

	/** Support for 7.20, to find max value's index */
	private static int maxIndexOfArray(double[] arr, int tail) {
		double max = Double.MIN_VALUE;
		int index = 0;
		// check from tail to 0
		for (int i = tail; i >= 0; i--) {
			if (arr[i] > max) {
				max = arr[i];
				index = i;
			}
		}
		// this is the first max number from tail to 0
		return index;
	}

	/** Supporting for 7.20, to swap array */
	private static double[] swapArray(double[] arr, int a, int b) {
		if (a == b)return arr;
		double temp = arr[a];
		arr[a] = arr[b];
		arr[b] = temp;
		return arr;
	}

	/** Question 7.9 */
	private static double min(double[] array) {
		double min = Double.MAX_VALUE;
		for (int i = 0; i < array.length; i++) {
			if (array[i] < min) {
				min = array[i];
			}
		}
		return min;
	}

	/** Question 7.10 */
	private static int indexOfSmallestElement(double[] array) {
		double min = Double.MAX_VALUE;
		int minIndex = 0;
		for (int i = 0; i < array.length; i++) {
			if (array[i] < min) {
				min = array[i];
				minIndex = i;
			}
		}
		// Note that minValue is also found. Doing this again only to fulfill requirement
		// Else I can return a double[2] with two values at once
		return minIndex;
	}

	/** check array validation */
	private static boolean checkPositiveArray(double[] arr) {
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] < 0) {
				return false;
			}
		}
		return true;
	}

	/** my personal printer */
	private static void ptln(Object str) {
		try {
			System.out.println(str + "");
		} catch (Exception e) {
			System.out.println("Error. Wrong Print Type.");
			e.printStackTrace();
			return;
		}
	}
}
