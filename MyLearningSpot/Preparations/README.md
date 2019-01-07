# Things need to do for Interview

Diary in Docs/

## Note Fragments

From WeChat CSDN's articles. Check more if got time.

* A stack with `getMin()`
  * Brute-Force keep a min outside, when smallest one `pop()`, need to iterate again. `pop()` O(n), else O(1)
  * Helper stack, sync with main stack. Time O(1), Space O(n)
  * `throw new Exception("aaa");` for custom `pop()`
  * In helper stack, store index of min value to reduce space complexity