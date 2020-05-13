//: [Previous](@previous)

/**
 # Remove K Digits

 Given a non-negative integer *num* represented as a string, remove *k* digits from the number so that the new number is the smallest possible.

 **Note:**

 - The length of *num* is less than 10002 and will be ≥ *k*.
 - The given *num* does not contain any leading zero.



 **Example 1:**

 ```
 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 ```



 **Example 2:**

 ```
 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 ```



 **Example 3:**

 ```
 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
 ```
 */


class Solution {
    //  20ms, 100%
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k >= num.count || num.count < 1 { return "0" }
        let chars = Array(num)
        var stackChar = [chars[0]], l = k, i = 1
        while i < chars.count {
            if l > 0, let v = stackChar.last, v > chars[i] {
                stackChar.popLast(); l -= 1
            } else {
                stackChar.append(chars[i]); i += 1
            }
        }
        for _ in 0..<l { stackChar.popLast() }
        while let c = stackChar.first, c == "0" {
            stackChar.removeFirst()
        }
        if stackChar.isEmpty { stackChar.append("0") }
        return String(stackChar)
    }
}

let s = Solution()
s.removeKdigits("1432219", 3)
s.removeKdigits("10200", 1)
s.removeKdigits("10", 2)
s.removeKdigits("10", 1)
s.removeKdigits("112", 1)
s.removeKdigits("5337", 2)

//: [Next](@next)
