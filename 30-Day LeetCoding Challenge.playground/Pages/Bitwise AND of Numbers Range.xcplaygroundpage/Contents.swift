//: [Previous](@previous)

/**
 # Bitwise AND of Numbers Range

 Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

 **Example 1:**

 ```
 Input: [5,7]
 Output: 4
 ```

 **Example 2:**

 ```
 Input: [0,1]
 Output: 0
 ```
 */

class Solution {
    // 28 ms
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var m = m, n = n, i = 0
        while m < n {
            m = m >> 1
            n = n >> 1
            i += 1
        }
        return m << i
    }
    
    // 20 ms
    func rangeBitwiseAnd0(_ m: Int, _ n: Int) -> Int {
        var m = m, n = n
        while m < n {
            n = n & (n - 1)
        }
        return m & n
    }
}

let s = Solution()

s.rangeBitwiseAnd(4, 7)
s.rangeBitwiseAnd(149, 155)
s.rangeBitwiseAnd(136, 146)
s.rangeBitwiseAnd(0, 1)


//: [Next](@next)
