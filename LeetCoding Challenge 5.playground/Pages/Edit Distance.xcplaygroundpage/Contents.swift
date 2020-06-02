//: [Previous](@previous)

/**
 # Edit Distance

 Given two words *word1* and *word2*, find the minimum number of operations required to convert *word1* to *word2*.

 You have the following 3 operations permitted on a word:

 1. Insert a character
 2. Delete a character
 3. Replace a character

 **Example 1:**

 ```
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 ```

 **Example 2:**

 ```
 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 ```
 */

class Solution {
    // 56ms, 97.35%
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let n = word1.count, m = word2.count, word1 = Array(word1), word2 = Array(word2)
        if n * m == 0 { return n + m }
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

        for i in 0 ... n { dp[i][0] = i }
        for j in 0 ... m { dp[0][j] = j }
        for i in 1 ... n {
            for j in 1 ... m {
                let d1 = dp[i - 1][j] + 1, d2 = dp[i][j - 1] + 1, d3 = dp[i - 1][j - 1] + (word1[i - 1] != word2[j - 1] ? 1 : 0)
                dp[i][j] = min(d1, d2, d3)
            }
        }
        return dp[n][m]
    }
}

//: [Next](@next)
