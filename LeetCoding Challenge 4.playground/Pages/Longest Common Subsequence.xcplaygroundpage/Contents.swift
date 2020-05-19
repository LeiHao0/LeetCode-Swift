//: [Previous](@previous)

/**
 # Longest Common Subsequence

 Given two strings `text1` and `text2`, return the length of their longest common subsequence.

 A *subsequence* of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A *common subsequence* of two strings is a subsequence that is common to both strings.

 If there is no common subsequence, return 0.

 **Example 1:**

 ```
 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 ```

 **Example 2:**

 ```
 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 ```

 **Example 3:**

 ```
 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
 ```

 **Constraints:**

 - `1 <= text1.length <= 1000`
 - `1 <= text2.length <= 1000`
 - The input strings consist of lowercase English characters only.

   Hide Hint #1

 Try dynamic programming. DP[i][j] represents the longest common subsequence of text1[0 ... i] & text2[0 ... j].

   Hide Hint #2

 DP[i][j] = DP[i - 1][j - 1] + 1 , if text1[i] == text2[j] DP[i][j] = max(DP[i - 1][j], DP[i][j - 1]) , otherwise
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var i = 0, j = 0
        let (t1, t2) = (text1.count >= text2.count) ? (Array(text1), Array(text2)) : (Array(text2), Array(text1))
        while i < t1.count, j < t2.count {
            if t1[i] == t2[j] {
                i += 1; j += 1
            } else {
                i += 1
            }
        }
        return j
    }
}

let s = Solution()
s.longestCommonSubsequence("abcde", "ace")
s.longestCommonSubsequence("", "ace")
s.longestCommonSubsequence("aaa", "aab")
s.longestCommonSubsequence("abcd", "acryt")
s.longestCommonSubsequence("psnw", "vozsh")
s.longestCommonSubsequence("ezupkr", "ubmrapg")

//: [Next](@next)
