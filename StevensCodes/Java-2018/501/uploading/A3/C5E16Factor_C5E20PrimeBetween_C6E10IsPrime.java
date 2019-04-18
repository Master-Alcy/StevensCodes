import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * @author Jingxuan Ai
 * @author 10431517
 */
public class C5E16Factor_C5E20PrimeBetween_C6E10IsPrime {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int goOn = 1;
		System.out.println("For question 5.16/5.20/6.10, as teacher specified:\n"
						+ "1. Show the first 50 primes(5.20).\n"
						+ "2. Generate an array containing prime numbers less than 1000(5.20)\n"
						+ "3. In loop as user to test if a number is prime(6.10).\n"
						+ "4. If it's not a prime, show its factors(5.16).\n"
						+ "#Note that in range 0 ~ 1000 I'll do array checking,\n"
						+ "#1000 and above I'll do isPrime checking,\n"
						+ "#and negative numbers I'll do definition checking.\n"
						+ "#Also all non-prime integers in both negative and positive range\n"
						+ "#can have factors. If a number have no factors others than itself,\n"
						+ "#I'll just show an empty list.");
		ArrayList<Integer> testlist1 = DisplayPrimes(); // 1. 50 primes printed
		// 2. arraylist generated, range from 0 to 1000
		Asker: while (goOn == 1) {
			System.out.println("Enter an integer: ");
			testCase: try {
				int a = sc.nextInt();
				if (a < 0) {
					// Definition of prime is integers >= 1
					System.out.println("Integer " + a
									+ " is NOT a prime by definition. Its factors are: \n"
									+ findFactors(a).toString());
					break testCase;
				}
				if (a > 1000) {
					System.out.println("It's out of the range of array checking.\n"
									+ "with myIsPrime method(6.10): ");
					if (myIsPrime(a)) { // 3.
						System.out.println("Integer " + a + " is a prime.");
					} else { // 4.
						System.out.println("Integer " + a
								+ " is NOT a prime. Its factors are: \n"
								+ findFactors(a).toString());
					}
					break testCase;
				}
				if (testlist1.contains(a)) { // 3.
					System.out.println("With test with array method: \n"
							+ "Integer " + a + " is a prime.");
				} else { // 4.
					System.out.println("With test with array method: \n"
							+ "Integer " + a
							+ " is NOT a prime. Its factors are: \n"
							+ findFactors(a).toString());
				}
			} catch (InputMismatchException e) {
				System.out.println("Need a valid integer: " + e);
				sc.next();	//delete the wrong input to make sure loop goes on !!!
			}
			
			System.out.println("Enter 1 to continue, else to end.");
			try {
				goOn = sc.nextInt();
				if (goOn != 1) {
					break Asker;
				}
			} catch (InputMismatchException e) {
				sc.next();	//delete this token in stream
				break Asker;
			}
		}
		sc.close();
		System.out.println("Questions 5.16/5.20/6.10 ends here.");
	}

	/**Question 5.20*/
	private static ArrayList<Integer> DisplayPrimes() {
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		list2.add(2);
		for (int number = 3; number <= 1000; number++) {
			if (myIsPrime(number)) {
				list2.add(number);
			}
		}
		// list2 is full of primes now, print out 50 primes
		StringBuilder sb = new StringBuilder();
		int countEight = 0;
		for (int index = 0; index < 50; index++) {
			sb.append(list2.get(index) + " ");
			countEight++; // to avoid O(n^2)
			if (countEight == 8) {
				sb.append("\n");
				countEight = 0;
			}
		}
		System.out.println("\n50 primes is shown below: \n" + sb);
		return list2;
	}

	/**Question 6.10*/
	private static boolean myIsPrime(int number) {
		if (number < 0) {
			number = - number;
		}
		for (int i = 2; i <= number / 2; i++) {
			if (number % i == 0) {
				return false;
			}
		}
		return true;
	}

	/**Question 5.16*/
	private static ArrayList<Integer> findFactors(int x) {
		ArrayList<Integer> list1 = new ArrayList<Integer>();
		if (x < 0) { 
			System.out.println("Each two opposite but same numbers are considered a pair.\n"
					+ "Choose one from the first pair and then 2nd and goes on.");
			list1 = findFactors((-1) * x);
			// handle negative values by add a duplicate negative pair
			for (int i = 0; i < list1.size(); i += 2) {
				list1.add(i + 1, (-1) * list1.get(i));
			}
			return list1;
		} else if (x < 4) { // 0,1,2,3
			return list1;
		} else { // [2, x]
			// loop over factors
			int limit = x / 2;
			for (int i = 2; i <= limit; i++) {
				while (x % i == 0) {
					list1.add(i);
					x /= i;
				}
			}
			return list1;
		}
	}
	// Whole program ends here
}