//: [Previous](@previous)

class Solution {
    func minStartValue(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var lv = nums[0], gv = lv
        for i in 1..<nums.count {
            lv += nums[i]
            gv = min(gv, lv)
        }
        gv = gv > 0 ? 1 : 1 - gv
        return gv
    }
}

let s = Solution()
s.minStartValue([1,2]) // 1
s.minStartValue([1,-2,-3]) // 5

//: [Next](@next)
