//: [Previous](@previous)

/**
 Valid Parenthesis String

 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

 1. Any left parenthesis `'('` must have a corresponding right parenthesis `')'`.
 2. Any right parenthesis `')'` must have a corresponding left parenthesis `'('`.
 3. Left parenthesis `'('` must go before the corresponding right parenthesis `')'`.
 4. `'*'` could be treated as a single right parenthesis `')'` or a single left parenthesis `'('` or an empty string.
 5. An empty string is also valid.

 **Example 1:**

 ```
 Input: "()"
 Output: True
 ```

 **Example 2:**

 ```
 Input: "(*)"
 Output: True
 ```

 **Example 3:**

 ```
 Input: "(*))"
 Output: True
 ```

 **Note:**

 1. The string size will be in the range [1, 100].
 */

class Solution {
    //    Runtime: 0 ms, 100%
    //    Memory Usage: 20.7 MB
    func checkValidString(_ s: String) -> Bool {
        var t = (0, 0)
        for c in s {
            t.1 += (c != ")" ? 1 : -1)
            if t.1 < 0 { return false }
            t.0 += (c == "(" ? 1 : -1)
            t.0 = max(t.0, 0)
        }
        return t.0 == 0
    }

    //    Runtime: 4 ms, 94.44%
    //    Memory Usage: 20.9 MB
    func checkValidString1(_ s: String) -> Bool {
        return s.reduce((0, 0)) { let t = ($0.0 + ($1 == "(" ? 1 : -1), $0.1 + ($1 != ")" ? 1 : -1))
            return t.1 < 0 ? (-10000, -10000) : (max(t.0, 0), t.1)
        }.0 == 0
    }

    func checkValidString0(_ s: String) -> Bool {
        var stack = [Character]()
        for c in s {
            if c == "(" || c == "*" {
                stack.append(c)
            } else {
                if let t = stack.lastIndex(of: "(") {
                    stack.remove(at: t)
                } else if let t = stack.lastIndex(of: "*") {
                    stack.remove(at: t)
                } else {
                    return false
                }
            }
        }
        while let t = stack.popLast() {
            if t == "(" {
                return false
            }
            if let t = stack.lastIndex(of: "(") {
                stack.remove(at: t)
            }
        }
        return stack.isEmpty
    }
}

let s = Solution()
s.checkValidString("()") // true
s.checkValidString("(*)") // true
s.checkValidString("(*))") // true
s.checkValidString("((*)") // true

//: [Next](@next)
