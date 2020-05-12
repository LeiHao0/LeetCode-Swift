//: [Previous](@previous)

class Solution {
    // 16ms, 83.97%
    func heightChecker(_ heights: [Int]) -> Int {
        return zip(heights, heights.sorted()).reduce(0) { return $0 + ($1.0 == $1.1 ? 0 : 1) }
    }
}

//: [Next](@next)
