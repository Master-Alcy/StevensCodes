package Chapter1;
import java.util.Arrays;
// This is how to use book library
import edu.princeton.cs.algs4.*;

/**
 * @author aijin
 */
@SuppressWarnings("unused")
public class Note_1 {

	public static void main(String[] args) {
		int i0 = 0;
		int[] a = new int[10];
		a[i0] = 1234;
		int[] b = a; // b is a pointer to a, same array
		b[i0] = 5678; // a[i] is now 5678.
		System.out.println(Arrays.toString(a) + "\n" + Arrays.toString(b));

		// SomeArray();
		// System.out.println(sqrt(10));
		/**
		 * Some important notes: 1. arg passed by value 2. method can be
		 * overloaded 3. method has only one return value 4. method can have
		 * side effects 5. recursion
		 */
		/**
		 * Understand String[] args => % java AMethod 5 100 200 5 -> args[0],
		 * 100 -> args[1], 200 -> args[2]
		 */
		/*
		int N = Integer.parseInt(args[0]);
		double lo = Double.parseDouble(args[1]);
		double hi = Double.parseDouble(args[2]);
		for (int i = 0; i < N; i++) {
			double x = java.util.concurrent.ThreadLocalRandom
					.current().nextDouble(lo, hi + 1);
			System.out.println("%.2f\n" + x);
			// Note this regex is not applied
		}
		*/
		//% java Note_1 1000 100.0 200.0 > data.txt
		//% java Note_1 < inputData.txt
		/**
		 * piping: Important. (async ???)
		 * % java RandomSeq 1000 100.0 200.0 | java Average
		 * The timing of precisely what happens is up to the operating 
		 * system: it might run RandomSeq until it produces some output, 
		 * and then run Average to consume that output, or it might run 
		 * Average until it needs some output, and then run RandomSeq 
		 * until it produces the needed output.
		 */
	}

	// recursive impl of binary-search
	private static int rank(int key, int[] a) {
		return rank(key, a, 0, a.length - 1);
	}

	private static int rank(int key, int[] a, int lo, int hi) {
		// Index of key in a[], if present,
		// is not smaller than lo and not larger than hi.
		if (lo > hi)
			return -1;
		int mid = lo + (hi - lo) / 2;
		if (key < a[mid])
			return rank(key, a, lo, mid - 1);
		else if (key > a[mid])
			return rank(key, a, mid + 1, hi);
		else
			return mid;
	}

	// abs of int
	private static int abs(int x) {
		if (x < 0)
			return -x;
		else
			return x;
	}

	// abs of double
	private static double abs(double x) {
		if (x < 0.0)
			return -x;
		else
			return x;
	}

	// primality test with i*i<=N!
	private static boolean isPrime(int N) {
		if (N < 2)
			return false;
		// Note: here use i*i<=N is really time saving
		for (int i = 2; i * i <= N; i++)
			if (N % i == 0)
				return false;
		return true;
	}

	// square root
	private static double sqrt(double c) {
		if (c < 0)
			return Double.NaN;
		double err = 1e-15;
		double t = c;
		while (Math.abs(t - c / t) > err * t)
			t = (c / t + t) / 2.0;
		return t;
	}

	// hypotenuse of a right triangle
	private static double hypotenuse(double a, double b) {
		return Math.sqrt(a * a + b * b);
	}

	// harmonic number
	private static double H(int N) {
		double sum = 0.0;
		for (int i = 1; i <= N; i++)
			sum += 1.0 / i;
		return sum;
	}

	private static void SomeArray() {
		int M = 10, N = 2; // 1st D -> rows, 2nd D -> cols. M-by-N array
		double[][] m = new double[M][N];
		for (int i = 0; i < M; i++) {
			for (int j = 0; j < N; j++) {
				m[i][j] = 1.0;
			}// End n for-loop
		}// End n^2 for-loop

		double[] a = new double[10];
		int L = a.length;

		// Find max
		double max = a[0];
		for (int i = 1; i < L; i++)
			if (a[i] > max)
				max = a[i];

		// compute avg
		double sum = 0;
		for (int i = 0; i < L; i++)
			sum += a[i];
		double average = sum / L;

		// copy array
		double[] b = new double[L];
		for (int i = 0; i < L; i++)
			b[i] = a[i];

		// reverse array
		for (int i = 0; i < L / 2; i++) {
			double temp = a[i];
			a[i] = a[L - 1 - i];
			a[L - i - 1] = temp;
		}

		// a[][]*b[][] = c[][]
		double[][] a1 = new double[L][L];
		double[][] b1 = new double[L][L];
		double[][] c = new double[L][L];
		for (int i = 0; i < L; i++)
			for (int j = 0; j < L; j++) {
				// Compute dot product of row i and column j.
				for (int k = 0; k < L; k++)
					c[i][j] += a1[i][k] * b1[k][j];
			}
	}
}