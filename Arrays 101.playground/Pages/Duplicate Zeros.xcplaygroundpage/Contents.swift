//: [Previous](@previous)

/**
 
# Duplicate Zeros

Given a fixed length array `arr` of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.

Note that elements beyond the length of the original array are not written.

Do the above modifications to the input array **in place**, do not return anything from your function.

 

**Example 1:**

```
Input: [1,0,2,3,0,4,5,0]
Output: null
Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
```

**Example 2:**

```
Input: [1,2,3]
Output: null
Explanation: After calling your function, the input array is modified to: [1,2,3]
```

 

**Note:**

1. `1 <= arr.length <= 10000`
2. `0 <= arr[i] <= 9`

  Hide Hint #1

This is a great introductory problem for understanding and working with the concept of in-place operations. The problem statement clearly states that we are to modify the array in-place. That does not mean we cannot use another array. We just don't have to return anything.

  Hide Hint #2

A better way to solve this would be without using additional space. The only reason the problem statement allows you to make modifications in place is that it hints at avoiding any additional memory.

  Hide Hint #3

The main problem with not using additional memory is that we might override elements due to the zero duplication requirement of the problem statement. How do we get around that?

  Hide Hint #4

If we had enough space available, we would be able to accommodate all the elements properly. The new length would be the original length of the array plus the number of zeros. Can we use this information somehow to solve the problem?
*/

class Solution {
    // Runtime: 40 ms, 94.87%%
    // Memory Usage: 21.5 MB
    func duplicateZeros(_ arr: inout [Int]) {
        var na = Array(repeating: 0, count: arr.count), i = 0, j = 0
        while j < na.count {
            na[j] = arr[i]
            if arr[i] == 0, j < na.count-1 { j += 1; na[j] = 0 }
            i += 1; j += 1
        }
        arr = na
    }
    
    //    Runtime: 60 ms, 7.69%
    //    Memory Usage: 21.8 MB
    func duplicateZeros0(_ arr: inout [Int]) {
        arr = Array(arr.flatMap({ $0 == 0 ? [0, 0] : [$0] })[0..<arr.count])
    }
}


let s = Solution()
var a = [1,0,2,3,0,4,5,0]

s.duplicateZeros(&a)
a

a = [1,2,3]
s.duplicateZeros(&a)
a

a = [8,4,5,0,0,0,0,7]
s.duplicateZeros(&a)
a

a = [0,1,7,6,0,2,0,7]
s.duplicateZeros(&a)
a // [0,0,1,7,6,0,0,2]

a = [1,5,2,0,6,8,0,6,0]
s.duplicateZeros(&a)
a

//: [Next](@next)
