//: [Previous](@previous)

class Solution {
    // 476ms, 66.22%
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
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
