//: [Previous](@previous)

class Solution {
    // 28ms, 65.23%
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set(nums1), set2 = Set(nums2)
        return Array(set1.intersection(set2))
    }
}

//: [Next](@next)
