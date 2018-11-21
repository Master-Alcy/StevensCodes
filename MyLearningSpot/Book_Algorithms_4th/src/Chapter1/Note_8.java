package Chapter1;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Note_8 {

	public static void main(String[] args) {
		Note_7.TestTwoSum("algs4-data\\1Mints.txt", 1000000);
		//Note_8.TestThreeSum("algs4-data\\1Mints.txt", 1000000);
		Note_8.TestThreeSum("algs4-data\\8Kints.txt",8000);
	}

	/** Try counting the actual time it takes to finish the method */
	public static void TestThreeSum(String filePath, int size) {
		Scanner sc;
		try {
			sc = new Scanner(new File(filePath));
			int[] arr = new int[size];
			int index = 0;

			Stopwatch timer1 = new Stopwatch();
			while (sc.hasNext()) {
				arr[index++] = sc.nextInt();
			}
			double readTime = timer1.elapsedTime();
			sc.close();
			Stopwatch timer2 = new Stopwatch();
			int count = ThreeSum.MergeSortAndBinarySearch(arr);
			double methodTime = timer2.elapsedTime();

			System.out.println("---------------------------------"
					+ "\nThreeSum\nOn size: " + size
					+ "\nThe time it takes to read the file is: " + readTime
					+ "secs\nTest if array is full: " + arr[size - 1]
					+ "\nThe time it takes to compute is: " + methodTime
					+ "secs.\nThe count is: " + count);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
