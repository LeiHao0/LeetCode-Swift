//: [Previous](@previous)

class Solution {
    
    
    //    Runtime: 16 ms
    //    Memory Usage: 21.2 MB
    //    23.37%
    private var setI = Set<Int>()
    func isHappy(_ n: Int) -> Bool {
        if n == 1 { return true }
        let r = String(n).map({ Int(String($0))! }).reduce(0) { $0 + $1*$1 }
        
        if setI.contains(r) { return false }
        
        setI.insert(r)
        return isHappy(r)
    }
}

let s = Solution()
s.isHappy(19) == true
s.isHappy(355) == false

//: [Next](@next)
