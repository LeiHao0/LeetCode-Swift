//: [Previous](@previous)

class Solution {
    //    Runtime: 12 ms
    //    Memory Usage: 21 MB
    func countElements(_ arr: [Int]) -> Int {
        let s = Set(arr)
        return arr.reduce(0) { $0 + (s.contains($1+1) ? 1 : 0) }
    }
}

let s = Solution()


s.countElements([1,2,3]) == 2
s.countElements([1,1,3,3,5,5,7,7]) == 0
s.countElements([1,3,2,3,5,0]) == 3
s.countElements([1,1,2,2]) == 2


//: [Next](@next)
