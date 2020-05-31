//: [Previous](@previous)

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let ans = nums.sorted(by: >)[..<2]
        return (ans[0]-1)*(ans[1]-1)
    }
}

//: [Next](@next)
