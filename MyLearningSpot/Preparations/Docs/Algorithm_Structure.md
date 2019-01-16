# Algorithm Structure

* 算法思想
  * 双指针
  * 排序
    * 快速选择
    * 堆排序
    * 桶排序
    * 荷兰国旗问题
  * 贪心思想
  * 二分查找
  * 分治
  * 搜索
    * BFS
    * DFS
    * Backtracking
  * 动态规划
    * 斐波那契数列
    * 矩阵路径
    * 数组区间
    * 分割整数
    * 最长递增子序列
    * 最长公共子序列
    * 0-1 背包
    * 股票交易
    * 字符串编辑
  * 数学
    * 素数
    * 最大公约数
    * 进制转换
    * 阶乘
    * 字符串加法减法
    * 相遇问题
    * 多数投票问题
    * 其它
* 数据结构相关
  * 链表
  * 树
    * 递归
    * 层次遍历
    * 前中后序遍历
    * BST
    * Trie
  * 栈和队列
  * 哈希表
  * 字符串
  * 数组与矩阵
  * 图
    * 二分图
    * 拓扑排序
    * 并查集
  * 位运算

## **算法思想**

## Dual Pointer

双指针主要用于遍历数组，两个指针指向不同的元素，从而协同完成任务。

* **167 - 有序数组的 Two Sum**
* **633 - 两数平方和**
* **345 - 反转字符串中的元音字符**
* **680 - 回文字符串**
* **88 - 归并两个有序数组**
* **141 - 判断链表是否存在环**
* **524 - 最长子序列**

## Sorting

### Quick Select

用于求解  **Kth Element**  问题，使用快速排序的 partition() 进行实现。  
需要先打乱数组，否则最坏情况下时间复杂度为 O(N<sup>2</sup>)

* **215 - Kth Largest Element in an Array**

### HeapSort

用于求解 TopK Elements 问题，通过维护一个大小为 K 的堆，堆中的元素就是 TopK Elements。

堆排序也可以用于求解 Kth Element 问题，堆顶元素就是 Kth Element。

快速选择也可以求解 TopK Elements 问题，因为找到 Kth Element 之后，再遍历一次数组，所有小于等于 Kth Element 的元素都是 TopK Elements。

可以看到，快速选择和堆排序都可以求解 Kth Element 和 TopK Elements 问题

* **215 - Kth Largest Element in an Array**