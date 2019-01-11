package search;

public class MedianOfTwoSortedArrays {

	public static void main(String[] args) {
		MedianOfTwoSortedArrays ms = new MedianOfTwoSortedArrays();
		int[] num1 = { 1, 3 };
		int[] num2 = { 2 };
		System.out.println(ms.findMedianSortedArrays(num1, num2));
	}
	
	/**Optimal, O(log min(m,n)) 56ms*/
	private double findMedianSortedArrays(int[] nums1, int[] nums2) {
		int Len1 = nums1.length;
		int Len2 = nums2.length;
		if (Len1 > Len2) // Make sure A1 is the shorter one.
			return findMedianSortedArrays(nums2, nums1);
		int lo = 0, hi = Len1;

		while (lo <= hi) {
			int cut1 = (lo + hi) / 2; // Try Cut 1
			int cut2 = (Len1 + Len2 + 1) / 2 - cut1; // Calculate Cut 2 accordingly
			//if cut1 is 0 it means nothing is there on left side. Use -INF for maxL1
            //if cut1 is length of input then there is nothing on right side. Use +INF for minR1
			double maxL1 = (cut1 == 0) ? Integer.MIN_VALUE : nums1[cut1 - 1];
			double minR1 = (cut1 == Len1) ? Integer.MAX_VALUE : nums1[cut1];
			double maxL2 = (cut2 == 0) ? Integer.MIN_VALUE : nums2[cut2 - 1];
			double minR2 = (cut2 == Len2) ? Integer.MAX_VALUE : nums2[cut2];
			
			if (maxL1 > minR2) // A1's lower half is too big; need to move left
				hi = cut1 - 1;
			else if (maxL2 > minR1) // A2's lower half too big; need to move right
				lo = cut1 + 1;
			else if ((Len1 + Len2) % 2 == 0) // Otherwise, that's the right cut.
				return (Math.max(maxL1, maxL2) + Math.min(minR1, minR2)) / 2.0;
			else
				return Math.max(maxL1, maxL2);
		}

		throw new IllegalArgumentException();
	}
}
