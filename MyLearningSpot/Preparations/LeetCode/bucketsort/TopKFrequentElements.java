package bucketsort;

import java.util.*;

public class TopKFrequentElements {

    public static void main(String[] args) {
        TopKFrequentElements tf = new TopKFrequentElements();
        int[] arr1 = {1, 1, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5};
        List res = tf.topKFrequent2(arr1, 2);
        System.out.println(Arrays.toString(res.toArray()));
    }

    /**
     * Bucket Sort. 23ms 96.7%, Time: O(n)
     */
    private List<Integer> topKFrequent2(int[] nums, int k) {
        int N = nums.length;
        Map<Integer, Integer> map = new HashMap<>((int) (N / 0.75 + 1));
        List<Integer> list = new ArrayList<>(N + 1);
        // Array of list of Integer, note frequency won't go above array size
        List<Integer>[] bucket = new ArrayList[N + 1];

        for (int num : nums)
            map.put(num, map.getOrDefault(num, 0) + 1);

        for (Map.Entry<Integer, Integer> aSet : map.entrySet()) {
            int key = aSet.getKey();
            int frequency = aSet.getValue();

            if (bucket[frequency] == null)
                bucket[frequency] = new ArrayList<>();

            bucket[frequency].add(key);
        }

        for (int i = bucket.length - 1; i >= 0 && list.size() < k; i--)
            if (bucket[i] != null)
                list.addAll(bucket[i]);

        return list;
    }

    /**
     * minHeap on entrySet with map. 91ms 28.5% Time: O(n log k)
     */
    private List<Integer> topKFrequent(int[] nums, int k) {
        int N = nums.length;
        //use an array to save numbers into different bucket whose index is the frequency
        Map<Integer, Integer> map = new HashMap<>((int) (N / 0.75 + 1));
        List<Integer> list = new ArrayList<>(N + 1);

        for (int num : nums)
            // map.getOrDefault is nice to remember
            map.put(num, map.getOrDefault(num, 0) + 1);

        PriorityQueue<Map.Entry<Integer, Integer>> heap = new PriorityQueue<>(
                (a, b) -> Integer.compare(a.getValue(), b.getValue()));

        for (Map.Entry<Integer, Integer> aSet : map.entrySet()) {
            heap.offer(aSet);
            if (heap.size() > k)
                heap.poll();
        }

        while (!heap.isEmpty())
            list.add(heap.poll().getKey());

        Collections.reverse(list);
        return list;
    }
}
