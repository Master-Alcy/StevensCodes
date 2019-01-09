package array;

public class KadaneMaxSub {

	public static void main(String[] args) {
		KadaneMaxSub ka = new KadaneMaxSub();
		// find max subarray sum
		int[] arr = { 1, -2, 3, 5, -2, 6, -1 };
		System.out.println(ka.maxSubArray(arr));
	}

	private int maxSubArray(int[] arr) {
		int max = 0, current = 0;
		int arrLen = arr.length;

		for (int i = 0; i < arrLen; i++) {
			current += arr[i];
			max = Math.max(current, max);
			current = current < 0 ? 0 : current;
		}

		return max;
	}

	public int maxProfit(int[] prices) {
		int max = 0, current = 0;
		
		for (int i = 1; i < prices.length; i++) {
			current = Math.max(0, current += prices[i] - prices[i - 1]);
			max = Math.max(current, max);
		}
		return max;
	}

}
