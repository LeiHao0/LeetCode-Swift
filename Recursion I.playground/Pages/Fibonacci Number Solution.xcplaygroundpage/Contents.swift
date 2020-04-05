//: [Previous](@previous)

//Runtime: 4 ms
//Memory Usage: 20.8 MB

class Solution {
    var arr = [0, 1] + Array(repeating: 0, count: 29)
    func fib(_ N: Int) -> Int {
        if N < 2 || arr[N] != 0 {
            return arr[N]
        } else {
            arr[N-1] = fib(N-1)
            return arr[N-1] + arr[N-2]
        }
    }
}

let s = Solution()
for i in 0...30 {
    print(i, s.fib(i))
}

//: [Next](@next)
