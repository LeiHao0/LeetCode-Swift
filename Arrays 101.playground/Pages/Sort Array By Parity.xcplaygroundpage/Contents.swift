//: [Previous](@previous)


class Solution {
    // 72 ms, 83.81%
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var even = [Int](), odd = even
        for i in A {
            i % 2 == 0 ? (even.append(i)) : (odd.append(i))
        }
        return even + odd
    }
}


//: [Next](@next)
