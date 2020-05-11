//: [Previous](@previous)

class Solution {
    
    // 56ms, 15.32%
    func checkIfExist(_ arr: [Int]) -> Bool {
        var dict = Dictionary<Int, Int>()
        for i in arr {
            dict[i] = (dict[i] ?? 0) + 1
        }
        for i in arr {
            if let v = dict[i*2], v >= ((i==0) ? 2 : 1) {
                return true
            }
        }
        return false
    }
}

let s = Solution()
s.checkIfExist([0,0])
s.checkIfExist([10,2,5,3])
s.checkIfExist([7,1,14,11])
s.checkIfExist([3,1,7,11])
s.checkIfExist([-2,0,10,-19,4,6,-8])

//: [Next](@next)
