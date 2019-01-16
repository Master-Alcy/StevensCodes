# Start this Diary on 2019/1/2

## 2019/1/2

* **1 - Two Sum - Easy**
  * HashMap's .containsKey
  * .get and .put
  * Rest is just iterating through
* **2 - Add Two Numbers - Medium**
  * Achieved first acceptance, though slow
  * Implemented with StringBuilder, BigInteger and String[]

## 2019/1/3

* **2 - Add Two Numbers - Medium**
  * Declare root node with dummy
    * `ListNode root = new ListNode(0)`
  * Use `ListNode tail = root` to hold value and act like 'temp'
  * Use Divide and Conquer to reduce the Sum-BigInteger to Sum-At-Each-Stage-Value:
    1. `stageSum = num1 + num2 + thisRound;`
    2. `thisRound = stageSum / 10;`
  * boolean_expression ? if_yes_return_this : else_return_this
* **146 - LRU Cache - Hard**
  * Cannot finish myself, due to lack of the knowledge of doubly linked list
  * I think I now understand doubly linked list's structure
  * Key Points:
    * Use HashMap to keep references
    * DoublyLinkedList to achieve O(1) get and put because the node can remove itself without other references
    * DoublyLinkedList need to care its resource leak
  * Need to redo this with paper sometime later
* **20 - Valid Parentheses - Easy**
  * First try is slow, trying to speeding up

## 2019/1/4

* **20 - Valid Parentheses - Easy**
  * My Own idea runs in 8ms, Optimal one from discussion board makes it to 5ms
  * Key Points:
    * use switch(char) and push ')' directely.
    * `string.toCharArray()` is a bit slower than using `charAt(index)`
    * Since the String is implemented with an array, the charAt() method is a constant time operation.
* ~~**200 - Number of Islands - Medium - *SKIP***~~
  * No idea, go see help
    * Go learn DFS
    * Go learn BFS
    * Go learn Disjoint Set (Union Find)
* **104 - Maximum Depth of Binary Tree - Easy**
  * Some Knowledge
    * Breadth First Traversal (Or Level Order Traversal)
      * O(w), w is maximum width
    * Depth First Traversals
      * O(h), h is maximum height
        * Inorder Traversal (Left-Root-Right)
        * Preorder Traversal (Root-Left-Right)
        * Postorder Traversal (Left-Right-Root)
    * In terms of Space Complexity:
      * Less Balanced: BFS uses less space
      * More Balanced: DFS uses less space
    * DFS are typically recursive, which requires to call overheads.
    * If we search something closer to root, we would prefer BFS. And if it's closer to a leaf, we would prefer DFS.
  * Key Points:
    * TreeNode is implemented just like doubly linked list, except that instead of .prev and .next, we use .left and .right here
    * For recursion, just increase depth for each node
    * `Deque<Node> queue = new ArrayDeque<>()` This is a better way for both Queue and Stack
    * The non-recursive Iterable maxDepth is nice to keep in mind

## 2019/1/7 (5 & 6 are weekends)

* **684 - Redundant Connection - Medium**
  * UF types: (No.5 has minimal Tree Height and is Thus the optimal one)
    1. Quick-Find
    2. Quick-Union
    3. Weighted Quick-Union
    4. Weighted Quick-Union with path compression
    5. Weighted Quick-Union by rank with path compression
    * Constructor: O(N), Union: O(near 1), Find O(near 1)
  * Techniques:
    * path compression: `parent[node] = parent[parent[node]];`
    * use rank as size (weighted)
* **200 - Number of Islands - Medium - *CONTINUE***
  * First accept with UF, 13.46%. Need to check DFS and BFS.
    * Need to think about `[]` and out of boundary for array
    * UF only modified constructor, where:
      1. Make the count to the number of lands
      2. Map the matrix to array for `parent[current]` and `rank[current]`
    * Method: `numIslands(char[][] grid)` union the point to the right and down
  * Now here is the DFS and BFS:
    * DFS (Flood Fill Algorithm)
      * `private void DFS(char[][] grid, int i, int j, int row, int col)`
      * recursively call until return on boundary
      * mark current land to water
    * BFS:
      * Instead of Recursion, use queue and while loop to go over lands

## 2019/1/8 (Low Efficiency)

* **3 - Longest Substring Without Repeating Characters - Medium**
  * Learning KMP...
    * Understand KMP and its implementation
    * Understand BM, but implementation too long.
    * Due to low efficiency today, need to continue on this question tomorrow

## 2019/1/9 (Low Efficiency DAMMMMIT)

* **3 - Longest Substring Without Repeating Characters - Medium - *CONTINUE***
  * Dynamic Programming Problem:
    * Brute Force in O(n^3). Idea: Check Unique with HashSet();
    * `Set<Character> set = new HashSet<>();`. Iterate once and dynamic check. For char exists in set, move head pointer ahead. For char don't exist, move tail pointer ahead.
    * **Key is to make sure there are all unique and *new* chars between two pointers.**
    * `Map<Character, Integer> map = new HashMap<>();` Save char with it's max unique length
    * `int[] index = new int[256];` ASCII range 256. Optimized
    * Kadane's Algorithm:
      * `current = max(newElement, current + newElement)`
      * if newEle + oldMax smaller than newEle, then dump oldMax and replace with newEle
      * `maxSoFar = max(maxSoFar, current)`
      * try if new current is larger than old sum
      * (need to practice)

## 2019/1/10 (Low Efficiency DAMMMMIT)

* **4 - Median of Two Sorted Arrays - Hard**
  * <https://www.youtube.com/watch?v=LPFhl65R7ww>
  * KeyPoints:
    * Understand how to allocate cut1 and cut2
    * Start from shorter array, define cut1 and calculate cut2, key is balance the number of left and right
    * Fullfull condition: `maxL1 <= minR2 && maxL2 <= minR1` else move the cut
    * use `Integer.MIN_VALUE` and `Integer.MAX_VALUE` for boundary condition
    * (need to practice)

## 2019/1/11

This is where to find the order of doing leetcode:  
***<https://github.com/CyC2018/CS-Notes/blob/master/docs/notes/Leetcode%20%E9%A2%98%E8%A7%A3.md>***
Following this guide from now on!

### Dual Pointer (1)

* **167 - Two Sum II - Input array is sorted - Medium**
  * easy. O(n)
* **663 - Sum of Square Numbers - Easy**
  * easy, O(n), much faster than hashset method

## 2019/1/14 (12 & 13 are weekends)

### Dual Pointer (2)

* **345 - Reverse Vowels of a String - Easy**
  * `return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';` a nice way to check characters
  * This is a better way of incrementation
    ```java
      while (i < j && !isVowel(lo))
          lo = cArr[++i];
    ```
  * `new String(char[])`
* **680 - Valid Palindrome II - Easy**
  * first try too slow, string build approch
  * second try instead of stringbuilder, check the string from two end, Key is:
    * `return isPalindrome2(s, i, j - 1) || isPalindrome2(s, i + 1, j);`
  * This can 'delete' the head and tail of remaining string
* **88 - Merge Sorted Array - Easy**
  * two while loops's approch is a bit slower
  * Note that when nums2[] runs out, the rest of nums1[] elements is smaller, thus, no need to further sort

## 2019/1/15

### Dual Pointer (3)

* **141 - Linked List Cycle - Easy**
  * Succeed with two pointer, but many errors in boundary
    * need to consider how to avoid NullPointerException
  * HashSet proceed is much slower
* **524 - Longest Word in Dictionary through Deleting - Medium**
  * `(String).compareTo((String))` compare in lexicographically order
  * count number of same char to see if longer string contains shorter one

### Sorting (1)

#### Quick Select, HeapSort

* **215 - Kth Largest Element in an Array - Medium**
  * Arrays.sort is the Optimal solution with Time: O(n log n) and Space: O(1)
  * HeapSort with PriorityQueue gives Time: O(n log k), Space O(k)
  * QuickSelect, Time: O(n) (almost guaranteed) Space: O(1)
    * shuffle to randomize the array
    * partition and exch for quick select
    * Will dig deeper tomorrow

## 2019/1/16 (Low Efficiency: News and Phone)

### Sorting (2)

#### Quick Select

* **215 - Kth Largest Element in an Array - Medium**
  * QuickSelect:
    * randomly choose (or shuffle array first) a pivot
    * move everything smaller to left with partition method
    * judge this pivot index, see if it's kth largest
      * same => return this
      * larger than k's index, quickSelect on left side
      * smaller than k's index, quickSelct on right side
  * QuickSelect is avg O(n) and in place O(1) method. random to prevent worst case