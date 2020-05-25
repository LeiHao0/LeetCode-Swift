//: [Previous](@previous)

/**
 # Uncrossed Lines

 We write the integers of `A` and `B` (in the order they are given) on two separate horizontal lines.

 Now, we may draw *connecting lines*: a straight line connecting two numbers `A[i]` and `B[j]` such that:

 - `A[i] == B[j]`;
 - The line we draw does not intersect any other connecting (non-horizontal) line.

 Note that a connecting lines cannot intersect even at the endpoints: each number can only belong to one connecting line.

 Return the maximum number of connecting lines we can draw in this way.

  

 **Example 1:**

 ![img](https://assets.leetcode.com/uploads/2019/04/26/142.png)

 ```
 Input: A = [1,4,2], B = [1,2,4]
 Output: 2
 Explanation: We can draw 2 uncrossed lines as in the diagram.
 We cannot draw 3 uncrossed lines, because the line from A[1]=4 to B[2]=4 will intersect the line from A[2]=2 to B[1]=2.
 ```

 **Example 2:**

 ```
 Input: A = [2,5,1,2,5], B = [10,5,2,1,5,2]
 Output: 3
 ```

 **Example 3:**

 ```
 Input: A = [1,3,7,1,7,5], B = [1,9,2,5,1]
 Output: 2
 ```

  

 **Note:**

 1. `1 <= A.length <= 500`
 2. `1 <= B.length <= 500`
 3. `1 <= A[i], B[i] <= 2000`

   Hide Hint #1

 Think dynamic programming. Given an oracle dp(i,j) that tells us how many lines A[i:], B[j:] [the sequence A[i], A[i+1], ... and B[j], B[j+1], ...] are uncrossed, can we write this as a recursion?
 */

class Solution {
    // 44ms, 100%
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: B.count+1), count: A.count+1)
        for i in 1...A.count {
            for j in 1...B.count {
                dp[i][j] = (A[i-1] == B[j-1]) ? (1 + dp[i-1][j-1]) : max(dp[i-1][j], dp[i][j-1])
            }
        }
        return dp[A.count][B.count]
    }
}

let s = Solution()
s.maxUncrossedLines([1,4,2], [1,2,4]) // 2
s.maxUncrossedLines([2,5,1,2,5], [10,5,2,1,5,2]) // 3
s.maxUncrossedLines([1,3,7,1,7,5], [1,9,2,5,1]) // 2



//: [Next](@next)
