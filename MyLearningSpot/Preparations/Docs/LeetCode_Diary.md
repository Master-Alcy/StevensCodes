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
      * 