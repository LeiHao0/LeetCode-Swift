//: [Previous](@previous)

/**
 # Valid Perfect Square

 Given a positive integer *num*, write a function which returns True if *num* is a perfect square else False.

 **Note:** **Do not** use any built-in library function such as `sqrt`.

 **Example 1:**

 ```
 Input: 16
 Output: true
 ```

 **Example 2:**

 ```
 Input: 14
 Output: false
 ```
 */

class Solution {
    // Newton's Algorithm
    // 4ms, 84.52%
    func isPerfectSquare(_ num: Int) -> Bool {
        var x = (num+1)/2
        while x*x > num {
            x = (x + num/x) / 2
        }
        return x*x == num
    }
    
    //  0ms, 100%
    func isPerfectSquare1(_ num: Int) -> Bool {
        var i = 1, j = (num+1)/2
        while i <= j {
            let mid = i + (j-i)/2
            let v = mid*mid
            if v == num { return true }
            v > num ? (j = mid-1) : (i = mid+1)
        }
        return false
    }
    
    //  4ms, 84.52%
    func isPerfectSquare0(_ num: Int) -> Bool {
        var i = 1, j = num
        while i <= j {
            let mid = i + (j-i)/2
            let v = mid*mid
            if v == num { return true }
            v > num ? (j = mid-1) : (i = mid+1)
        }
        return false
    }
}

let s = Solution()
s.isPerfectSquare(1)
s.isPerfectSquare(2)
s.isPerfectSquare(3)
s.isPerfectSquare(4)
s.isPerfectSquare(14)
s.isPerfectSquare(16)


//: [Next](@next)
