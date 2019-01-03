package hashmap;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class TwoSum {

	public static void main(String[] args) {
		TwoSum t = new TwoSum();
		int[] a = { 2, 7, 11, 15 };
		int[] result = t.twoSum(a, 9);
		System.out.println(Arrays.toString(result));
	}

	public int[] twoSum(int[] nums, int target) {
		Map<Integer, Integer> map = new HashMap<>();
		
		// Iterating through array integers
		for (int i = 0; i < nums.length; i++) {
			
			// This is the number we need to find
            int numNeed = target - nums[i];
			if (map.containsKey(numNeed)) {
				return new int[] { map.get(numNeed), i };
			}
			
			// First number being put into Map here
			map.put(nums[i], i);
		}
		return new int[] { 0, 0 };
	}
}