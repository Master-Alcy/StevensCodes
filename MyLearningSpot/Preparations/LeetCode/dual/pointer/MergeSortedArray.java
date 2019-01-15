package dual.pointer;

import java.util.Arrays;

public class MergeSortedArray {

    public static void main(String[] args) {
        MergeSortedArray ms = new MergeSortedArray();
        int[] num1 = {1, 2, 3, 0, 0, 0};
        int[] num2 = {2, 5, 6};
        ms.merge(num1, 3, num2, 3);
        System.out.println(Arrays.toString(num1));
    }

    /**
     * second try: 6ms
     */
    private void merge2(int[] nums1, int m, int[] nums2, int n) {
        int last1 = m - 1, last2 = n - 1, merged = m + n - 1;

        while (last1 >= 0 && last2 >= 0) {
            if (nums1[last1] > nums2[last2])
                nums1[merged--] = nums1[last1--];
            else
                nums1[merged--] = nums2[last2--];
        }
        // If last1 >= 0 && last2 < 0, then array already sorted
        while (last2 >= 0)
            nums1[merged--] = nums2[last2--];
    }

    /**
     * first try: 4ms 98.75% Optimal
     */
    private void merge(int[] nums1, int m, int[] nums2, int n) {
        int tailX = m - 1, tailY = n - 1, mergedTail = m + n - 1;

        while (mergedTail >= 0) {
            if (tailX < 0) // nums1[] runs out
                nums1[mergedTail--] = nums2[tailY--];
            else if (tailY < 0) // nums2[] runs out
                break; // rest nums1 elements all smaller
            else if (nums1[tailX] > nums2[tailY])
                nums1[mergedTail--] = nums1[tailX--];
            else
                nums1[mergedTail--] = nums2[tailY--];
        }
    }
}
