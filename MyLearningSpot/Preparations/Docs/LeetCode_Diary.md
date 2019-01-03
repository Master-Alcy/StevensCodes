# Start this Diary on 2019/1/2

## 2019/1/2

* 1 - Two Sum - Easy
  * HashMap's .containsKey
  * .get and .put
  * Rest is just iterating through
* 2 - Add Two Numbers - Medium
  * Achieved first acceptance, though slow
  * Implemented with StringBuilder, BigInteger and String[]

## 2019/1/3

* 2 - Add Two Numbers - Medium
  * Declare root node with dummy
    * ListNode root = new ListNode(0)
  * Use ListNode tail = root to hold value and act like 'temp'
  * Use Divide and Conquer to reduce the Sum-BigInteger to Sum-At-Each-Stage-Value:
    1. stageSum = num1 + num2 + thisRound;
    2. thisRound = stageSum / 10;
  * boolean_expression ? if_yes_return_this : else_return_this
* 146 - LRU Cache - Hard
  * Cannot finish myself, due to lack of the knowledge of doubly linked list
  * I think I now understand doubly linked list's structure
  * Key Points:
    1. Use HashMap to keep references
    2. DoublyLinkedList to achieve O(1) get and put because the node can remove itself without other information
    3. DoublyLinkedList need to care its resource leak
  * Need to redo this with paper sometime later
* 20 - Valid Parentheses - Easy
  * First try is slow, trying to speeding up

