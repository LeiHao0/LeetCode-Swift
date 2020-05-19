//: [Previous](@previous)

/**
 # Find All Anagrams in a String

 Given a string **s** and a **non-empty** string **p**, find all the start indices of **p**'s anagrams in **s**.

 Strings consists of lowercase English letters only and the length of both strings **s** and **p** will not be larger than 20,100.

 The order of output does not matter.

 **Example 1:**

 ```
 Input:
 s: "cbaebabacd" p: "abc"

 Output:
 [0, 6]

 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 ```

 **Example 2:**

 ```
 Input:
 s: "abab" p: "ab"

 Output:
 [0, 1, 2]

 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 ```
 */

class Solution {
    // 64ms, 88%
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        func atoi(_ c: Character) -> Int {
            return Int(c.asciiValue! - 97)
        }
        if s.count < p.count { return [] }

        let s = Array(s), p = Array(p)
        var ans = [Int](), i = 1
        var arrS = Array(repeating: 0, count: 26), arrP = arrS
        i = 0
        while i < p.count {
            arrS[atoi(s[i])] += 1
            arrP[atoi(p[i])] += 1
            i += 1
        }

        if arrS == arrP { ans.append(0) }
        i = 1
        while i <= (s.count - p.count) {
            arrS[atoi(s[i - 1])] -= 1
            arrS[atoi(s[i + p.count - 1])] += 1
            if arrS == arrP { ans.append(i) }
            i += 1
        }
        return ans
    }

    // 252ms, 36%
    func findAnagrams1(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }

        let s = Array(s), p = Array(p)
        var ans = [Int](), i = 1, dictS = [Character: Int]()
        "abcdefghijklmnopqrstuvwxyz".map { dictS[$0] = 0 }
        var dictP = dictS

        i = 0
        while i < p.count {
            dictS[s[i]]! += 1
            dictP[p[i]]! += 1
            i += 1
        }

        if dictS == dictP { ans.append(0) }

        i = 1
        while i <= (s.count - p.count) {
            dictS[s[i - 1]]! -= 1
            dictS[s[i + p.count - 1]]! += 1
            if dictS == dictP { ans.append(i) }
            i += 1
        }
        return ans
    }

    // Time Limit Exceeded
    func findAnagrams0(_ s: String, _ p: String) -> [Int] {
        if s.count < p.count { return [] }
        let s = Array(s), p = p.sorted()
        var ans = [Int]()
        for i in 0 ... (s.count - p.count) {
            if s[i ..< (i + p.count)].sorted() == p {
                ans.append(i)
            }
        }
        return ans
    }
}

let s = Solution()
s.findAnagrams("cbaebabacd", "abc") // [0, 6]
s.findAnagrams("abab", "ab") // [0, 1, 2]
s.findAnagrams("", "a")
s.findAnagrams("a", "a")
s.findAnagrams("", "aa")
s.findAnagrams("aaa", "aa")
s.findAnagrams("baa", "aa")

//: [Next](@next)
