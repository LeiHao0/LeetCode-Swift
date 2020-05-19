//: [Previous](@previous)

class Solution {
    private var setI = Set<Int>()

    //    Runtime: 8 ms
    //    Memory Usage: 20.9 MB
    //    79.69%
    func isHappy(_ n: Int) -> Bool {
        if n == 1 { return true }
        var i = n, r = 0
        while i > 0 {
            let t = i % 10
            r += t * t
            i /= 10
        }

        if setI.contains(r) { return false }

        setI.insert(r)
        return isHappy(r)
    }

    //    Runtime: 16 ms
    //    Memory Usage: 21.2 MB
    //    23.37%
    func isHappy1(_ n: Int) -> Bool {
        if n == 1 { return true }
        let r = String(n).map { Int(String($0))! }.reduce(0) { $0 + $1 * $1 }

        if setI.contains(r) { return false }

        setI.insert(r)
        return isHappy(r)
    }
}

let s = Solution()
s.isHappy(19) == true
s.isHappy(355) == false

//: [Next](@next)
