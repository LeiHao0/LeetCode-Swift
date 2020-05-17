//: [Previous](@previous)

class Solution {
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        return zip(startTime, endTime).reduce(0) { $0 + ((queryTime >= $1.0 && queryTime <= $1.1) ? 1 : 0) }
    }
}

let s = Solution()
s.busyStudent([1,2,3], [3,2,7], 4)

//: [Next](@next)
