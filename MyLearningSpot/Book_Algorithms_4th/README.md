# Best Book for Algorithms

Short, Clear and Strong. Solution in this URL:  
<https://algs4.cs.princeton.edu/code/>

## ***Java8 source code (java.util.Arrays) contains SOOOOO many great sorting methods!!!!!!!!!!!***

The break point of efficiency for parallelsort and sort is around 30k, depending on cpu. The basic params type is sorted with adjusted quicksort, the object types are with adjusted merge sort.

### Arrays.sort(array) / Or with comparator

A stable, adaptive, iterative mergesort that requires far fewer than n lg(n) comparisons when running on partially sorted arrays, while offering performance comparable to a traditional mergesort when run on random arrays.

### Arrays.parallelSort(arrays) / Or with comparator

Sorts the specified array of objects into ascending order, according to the of its elements. All elements in the array must implement the interface. This sort is guaranteed to be stable. Note The sorting algorithm is a parallel sort-merge that breaks the array into sub-arrays that are themselves sorted and then merged. The algorithm requires a working space no greater than the size of the original array. The ForkPool and ForkJoin is used to execute any parallel tasks.

### Arrays.binarySearch(array, key)

Searches a range of the specified array of ints for the specified value using the binary search algorithm. The range must be sorted prior to making this call.