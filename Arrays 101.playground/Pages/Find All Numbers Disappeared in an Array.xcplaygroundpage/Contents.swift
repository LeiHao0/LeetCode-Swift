//: [Previous](@previous)

class Solution {
    // 436ms, 96.39%
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums, ans = [Int]()
        for i in 0 ..< nums.count {
            let index = abs(nums[i]) - 1
            if nums[index] > 0 { nums[index] *= -1 }
        }
        for i in 0 ..< nums.count {
            if nums[i] > 0 { ans.append(i + 1) }
        }
        return ans
    }

    // 476ms, 66.22%
    func findDisappearedNumbers0(_ nums: [Int]) -> [Int] {
        let sets = Set(nums)
        var a = [Int]()
        for i in 0 ..< nums.count {
            if !sets.contains(i + 1) { a.append(i + 1) }
        }
        return a
    }
}

let s = Solution()
s.findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1])
s.findDisappearedNumbers([])
s.findDisappearedNumbers([1, 1])

//: [Next](@next)
