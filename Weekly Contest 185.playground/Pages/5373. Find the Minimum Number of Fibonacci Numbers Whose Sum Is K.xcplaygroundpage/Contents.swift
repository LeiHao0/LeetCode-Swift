//: [Previous](@previous)

class Solution {

    var fib = [1, 1, 2, 3, 5, 8, 13]
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        var i = fib.count-1
        while fib[i] < k {
            let t = fib[i] + fib[i-1]
            fib.append(t)
            i += 1
        }
        
        if fib.firstIndex(where: {$0 == k}) != nil {
            return 1
        }
        i = fib.firstIndex(where: {$0 > k}) ?? 1
        let d  = k - fib[i-1]
        if d == 0 {
            return 1
        } else {
            return 1 + findMinFibonacciNumbers(d)
        }
    }
    
}

let s = Solution()
s.findMinFibonacciNumbers(1) // 1
s.findMinFibonacciNumbers(7) // 2
s.findMinFibonacciNumbers(10) // 2
s.findMinFibonacciNumbers(19) // 3
s.findMinFibonacciNumbers(21) // 1
s.findMinFibonacciNumbers(59) // 1

//: [Next](@next)
