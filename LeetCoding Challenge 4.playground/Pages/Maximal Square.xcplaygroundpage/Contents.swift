//: [Previous](@previous)

/**
 # Maximal Square

 Solution

 Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

 **Example:**

 ```
 Input:

 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0

 Output: 4
 ```
 */


class Solution {
    //    280ms, 80.6%
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        var dp = Array(repeating: 0, count: matrix[0].count+1), p = 0, m = 0
        for i in 1...matrix.count {
            for j in 1...matrix[0].count {
                let t = dp[j]
                if matrix[i-1][j-1] == "1" {
                    dp[j] = min(p, dp[j-1], dp[j]) + 1
                    m = max(m, dp[j])
                } else {
                    dp[j] = 0
                }
                p = t
            }
        }
        return m*m
    }
}

//: [Next](@next)
