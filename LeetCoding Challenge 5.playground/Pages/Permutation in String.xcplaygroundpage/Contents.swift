//: [Previous](@previous)

/**
 # Permutation in String

 Given two strings **s1** and **s2**, write a function to return true if **s2** contains the permutation of **s1**. In other words, one of the first string's permutations is the **substring** of the second string.

  

 **Example 1:**

 ```
 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 ```

 **Example 2:**

 ```
 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
 ```

  

 **Note:**

 1. The input strings only contain lower case letters.
 2. The length of both given strings is in range [1, 10,000].

   Hide Hint #1

 Obviously, brute force will result in TLE. Think of something else.

   Hide Hint #2

 How will you check whether one string is a permutation of another string?

   Hide Hint #3

 One way is to sort the string and then compare. But, Is there a better way?

   Hide Hint #4

 If one string is a permutation of another string then they must one common metric. What is that?

   Hide Hint #5

 Both strings must have same character frequencies, if one is permutation of another. Which data structure should be used to store frequencies?

   Hide Hint #6

 What about hash table? An array of size 26?
 */

class Solution {
    // 36ms, 93.04%
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        func atoi(_ c: Character) -> Int { return Int(c.asciiValue! - 97) }
        
        let s1 = Array(s1), s2 = Array(s2)
        var arr1 = Array(repeating: 0, count: 26), arr2 = arr1, i = 1
        for c in s1 { arr1[atoi(c)] += 1 }
        for c in s2[..<s1.count] { arr2[atoi(c)] += 1 }
        if arr1 == arr2 { return true }
        while i <= s2.count-s1.count {
            arr2[atoi(s2[i-1])] -= 1
            arr2[atoi(s2[i-1+s1.count])] += 1
            if arr1 == arr2 { return true }
            i += 1
        }
        return false
    }
}

let s = Solution()
s.checkInclusion("b", "b")
s.checkInclusion("aab", "aba")
s.checkInclusion("ab", "eidbaooo")
s.checkInclusion("ab", "eidboaoo")
s.checkInclusion("adc", "dcda")




//: [Next](@next)
