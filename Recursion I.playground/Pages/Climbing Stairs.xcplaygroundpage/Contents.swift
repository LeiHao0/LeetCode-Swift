//: [Previous](@previous)

// Runtime: 4 ms
// Memory Usage: 20.8 MB

class Solution {
    var arr = [0, 1, 2, 3] + Array(repeating: 0, count: 127)
    func climbStairs(_ n: Int) -> Int {
        if n < 4 || arr[n] != 0 {
            return arr[n]
        } else {
            arr[n - 1] = climbStairs(n - 1)
            return arr[n - 1] + arr[n - 2]
        }
    }
}

Int8.max

let s = Solution()
for i in 0 ... 30 {
    print(i, s.climbStairs(i))
}

//: [Next](@next)
