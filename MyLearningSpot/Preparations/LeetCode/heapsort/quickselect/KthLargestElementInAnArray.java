package heapsort.quickselect;

import org.jetbrains.annotations.NotNull;

import java.util.Arrays;
import java.util.PriorityQueue;
import java.util.Random;

public class KthLargestElementInAnArray {

    public static void main(String[] args) {
        KthLargestElementInAnArray kth = new KthLargestElementInAnArray();
        int[] test1 = {3, 2, 3, 1, 2, 4, 5, 5, 6};
        int[] test2 = {3, 3, 3, 3, 3, 3, 3, 3, 3};
        int res = kth.findKthLargest3(test1, 4);
        System.out.println(res);
    }

    /**
     * Quick Select. Time: avg(almost guaranteed): O(n) Space: O(1)
     * 5ms, 94.5% Not Optimal but should remember
     */
    private int findKthLargest3(int[] nums, int k) {
        int size = nums.length;
        int number = quickSelect(nums, 0, size - 1, size - k);
        return number;
    }

    private int quickSelect(int[] nums, int left, int right, int k_index) {
        if (left == right) // one element in range
            return nums[left];
        // choose a random pivot_index
        Random random = new Random();
        int pivot_index = left + random.nextInt(right - left);
        pivot_index = partition(nums, left, right, pivot_index);

        // if the pivot is on (size - k)
        if (pivot_index == k_index)
            return nums[k_index];
        else if (pivot_index > k_index) // go left side
            return quickSelect(nums, left, pivot_index - 1, k_index);
        else // go right side
            return quickSelect(nums, pivot_index + 1, right, k_index);
    }

    private int partition(int[] nums, int left, int right, int pivot_index) {
        int pivot = nums[pivot_index];
        int index = left;
        // 1. move pivot to end
        swap(nums, pivot_index, right);

        // 2. move all smaller elements to the left
        for (int i = left; i <= right; i++) {
            if (nums[i] < pivot) {
                // swap the current nums[i] with initial left
                swap(nums, index, i);
                index++;
            }
        }

        // 3. move pivot to its final place
        swap(nums, index, right);
        return index;
    }

    private void swap(int[] a, int i, int j) {
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }

    /**
     * HeapSort. Time: O(n log k) Space: O(k)
     * 16ms, 51%
     */
    private int findKthLargest2(int[] nums, int k) {
        // This heap is the least element
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        for (int val : nums) {
            pq.offer(val);
            if (pq.size() > k)
                pq.poll();
        }
        return pq.peek();
    }

    /**
     * First Try, sort, Optimal
     * Time O(n log n) Space: O(1)
     * 8ms, 75% for parallelSort
     * 6ms, 86.63% for sort
     */
    private int findKthLargest1(int[] nums, int k) {
        // Arrays.parallelSort(nums);
        Arrays.sort(nums);
        return nums[nums.length - k];
    }
}
