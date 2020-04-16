//: [Previous](@previous)
/**
 # Squares of a Sorted Array

 Given an array of integers `A` sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

  

 **Example 1:**

 ```
 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 ```

 **Example 2:**

 ```
 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
 ```

  

 **Note:**

 1. `1 <= A.length <= 10000`
 2. `-10000 <= A[i] <= 10000`
 3. `A` is sorted in non-decreasing order.
 */

class Solution {
    
    // Runtime: 400 ms, 39.91%
    // Memory Usage: 22.8 MB
    func sortedSquares(_ A: [Int]) -> [Int] {
        return A.map({$0*$0}).sorted()
    }
}

let s = Solution()
s.sortedSquares([-4,-1,0,3,10]) == [0,1,9,16,100]
s.sortedSquares([-7,-3,2,3,11]) == [4,9,9,49,121]


//: [Next](@next)
