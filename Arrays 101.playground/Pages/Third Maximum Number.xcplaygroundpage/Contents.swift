//: [Previous](@previous)

class Solution {
    // 36ms, 92.56%
    func thirdMax(_ nums: [Int]) -> Int {
        var maxs = [Int.min, Int.min, Int.min]
        for n in nums {
            if n > maxs[2], maxs.firstIndex(of: n) == nil {
                maxs[2] = n
                if maxs[2] > maxs[1] {
                    maxs.swapAt(2, 1)
                    if maxs[1] > maxs[0] {
                        maxs.swapAt(1, 0)
                    }
                }
            }
        }
        return maxs[2] == Int.min ? maxs[0] : maxs[2]
    }
}

let s = Solution()
s.thirdMax([2, 2, 3, 1])

//: [Next](@next)
