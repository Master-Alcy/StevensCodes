import java.util.Arrays;
import java.util.Scanner;

public class BBS {
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Input lower bound then upper bound (ex: '1 20'), "
				+ "\n" + "numbers in between randomly generated: ");
		int lower = sc.nextInt();
		int upper = sc.nextInt();
		sc.close();
		int[] unsorted = new int[upper - lower + 1];
		for (int i = 0; i < upper - lower + 1; i++){
			unsorted[i] = (int)Math.round((Math.random()*(upper - lower)) + lower);
		}	
		System.out.println(Arrays.toString(unsorted));
		System.out.println(Arrays.toString(sort(unsorted)));
	}

	private static int[] sort(int[] arr) {
		boolean sort = true;
		int i, j;
		int direction = 0;
		int length = arr.length - 1;

		while (sort == true) {
			direction ++;
			sort = false;
			if (direction % 2 == 0) {	//backward
				for (j = length; j > 0; j--) {
					if (arr[j] < arr[j - 1]) {
						swap(arr, j , j-1);
						sort = true;
					}
				}
				length --;
			} else {					//forward
				for (i = 0; i < length; i++) {
					if (arr[i] > arr[i + 1]) {
						swap(arr, i, i + 1);
						sort = true;
					}
				}
			}
		}
		return arr;
	}
	
	private static void swap (int[] arr, int a, int b){
		int t0 = 0;
		t0 = arr[a];
		arr[a] = arr[b];
		arr[b] = t0;
	}
}