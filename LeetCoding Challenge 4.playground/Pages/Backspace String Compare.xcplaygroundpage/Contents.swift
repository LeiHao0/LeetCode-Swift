//: [Previous](@previous)

/**
 # Backspace String Compare
 
 Given two strings `S` and `T`, return if they are equal when both are typed into empty text editors. `#` means a backspace character.
 
 **Example 1:**
 
 ```
 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 ```
 
 **Example 2:**
 
 ```
 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 ```
 
 **Example 3:**
 
 ```
 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 ```
 
 **Example 4:**
 
 ```
 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 ```
 
 **Note**:
 
 1. `1 <= S.length <= 200`
 2. `1 <= T.length <= 200`
 3. `S` and `T` only contain lowercase letters and `'#'` characters.
 
 **Follow up:**
 
 - Can you solve it in `O(N)` time and `O(1)` space?
 */

class Solution {
    //    Runtime: 4 ms
    //    Memory Usage: 21.1 MB
    //    95%
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        func backs(_ s: String) -> String {
            var a = ""
            s.forEach { $0 == "#" ? _ = a.popLast() : a.append($0) }
            return a
        }
        return backs(S) == backs(T)
    }
    
    //    Runtime: 0 ms, faster than 100.00%
    //    Memory Usage: 21 MB, less than 100.00%
    //    100%
    func backspaceCompare0(_ S: String, _ T: String) -> Bool {
        return S.reduce(into: "") { $1 == "#" ? _ = $0.popLast() : $0.append($1) } == T.reduce(into: "") { $1 == "#" ? _ = $0.popLast() : $0.append($1) }
    }
}

let s = Solution()

var S = "ab#c", T = "ad#c"
s.backspaceCompare(S, T) == true

S = "ab##"; T = "c#d#"
s.backspaceCompare(S, T) == true

S = "a##c"; T = "#a#c"
s.backspaceCompare(S, T) == true


S = "a#c"; T = "b"
s.backspaceCompare(S, T) == false

//: [Next](@next)
