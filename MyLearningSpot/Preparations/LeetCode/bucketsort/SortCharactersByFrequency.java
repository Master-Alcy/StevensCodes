package bucketsort;

import java.util.*;

public class SortCharactersByFrequency {

    public static void main(String[] args) {
        SortCharactersByFrequency sc = new SortCharactersByFrequency();
        String test1 = "tree";
        String res = sc.frequencySort2(test1);
        System.out.println(res);
    }

    /**
     * Time: O(n log m) Heap solution
     * 98ms 35.57%
     */
    private String frequencySort3(String s) {
        if (s.length() < 3)
            return s;

        Map<Character, Integer> map = new HashMap<>();

        for (char c : s.toCharArray())
            map.put(c, map.getOrDefault(c, 0) + 1);

        PriorityQueue<Map.Entry<Character, Integer>> pq = new PriorityQueue<>(
                (a, b) -> b.getValue() - a.getValue()
        );
        pq.addAll(map.entrySet());

        StringBuilder sb = new StringBuilder();

        while (!pq.isEmpty()) {
            Map.Entry<Character, Integer> entry = pq.poll();
            char key = entry.getKey();
            int freq = entry.getValue();
            for (int i = 0; i < freq; i++)
                sb.append(key);
        }
        return sb.toString();
    }

    /**
     * Time: O(n)
     * using int[][] instead of list[], actually slower
     * 72ms, 45.37%, trying to modify
     * Modified runs in 10ms, 96.51%
     */
    private String frequencySort2(String s) {
        if (s.length() < 3)
            return s;
        int[] charMap = new int[123]; // end at z
        List<Character>[] bucket = new ArrayList[s.length() + 1];

        for (char c : s.toCharArray())
            charMap[c]++;

        for (int i = 32; i < 123; i++) { // from space to z
            int freq = charMap[i];
            if (freq == 0) // Probably a better way to reduce time here
                continue;
            if (bucket[freq] == null)
                bucket[freq] = new ArrayList<>();
            bucket[freq].add((char) i);
        }

        StringBuilder result = new StringBuilder(); // faster than string

        for (int maxFreq = bucket.length - 1; maxFreq >= 0; maxFreq--) {
            if (bucket[maxFreq] == null) // no char recorded here
                continue;
            for (char c : bucket[maxFreq])
                for (int i = 0; i < maxFreq; i++)
                    result.append(c);
        }// End of loop

        return result.toString();
    }

    /**
     * Time: O(n)
     * first try, bucket. 1083 ms, 7.38%
     * modified bucket, 38 ms, 71.81%
     */
    private String frequencySort1(String s) {
        if (s.length() < 3)
            return s;
        // no need to set a fix capacity for HashMap `(int) (s.length() / 0.75 + 1)`
        Map<Character, Integer> freqMap = new HashMap<>();
        List<Character>[] bucket = new ArrayList[s.length() + 1];

        for (char c : s.toCharArray())
            freqMap.put(c, freqMap.getOrDefault(c, 0) + 1);

        for (Map.Entry<Character, Integer> set : freqMap.entrySet()) {
            char key = set.getKey();
            int value = set.getValue();
            if (bucket[value] == null)
                bucket[value] = new ArrayList<>();
            bucket[value].add(key);
        }

        StringBuilder result = new StringBuilder();

        for (int maxFreq = bucket.length - 1; maxFreq >= 0; maxFreq--) {
            if (bucket[maxFreq] == null) // no char recorded here
                continue;
            for (char c : bucket[maxFreq])
                for (int j = 0; j < freqMap.get(c); j++)
                    result.append(c);
        }

        return result.toString();
    }
}
