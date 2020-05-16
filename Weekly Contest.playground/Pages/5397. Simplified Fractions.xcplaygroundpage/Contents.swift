//: [Previous](@previous)

class Solution {
    func simplifiedFractions(_ n: Int) -> [String] {
        var set = Set<Double>(), arr = [String]()
        for i in 1..<n { // i / j
            for j in (i+1)...n {
                let t = Double(i)/Double(j)
                if !set.contains(t) {
                    arr.append("\(i)/\(j)")
                    set.insert(t)
                }
            }
        }
        return arr
    }
}

let s = Solution()
s.simplifiedFractions(1)
s.simplifiedFractions(2)
s.simplifiedFractions(3)
s.simplifiedFractions(4)
s.simplifiedFractions(5)


//: [Next](@next)
