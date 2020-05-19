//: [Previous](@previous)

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        if candies.isEmpty { return [] }
        let m = candies.max()!
        return candies.map { ($0 + extraCandies) >= m }
    }
}

let s = Solution()

s.kidsWithCandies([], 3)
s.kidsWithCandies([2, 3, 5, 1, 3], 3)
s.kidsWithCandies([4, 2, 1, 1, 2], 1)
s.kidsWithCandies([12, 1, 12], 10)

//: [Next](@next)
