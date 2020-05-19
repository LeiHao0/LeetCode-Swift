//: [Previous](@previous)

class Solution {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var i = 1, j = 0, s = [String]()
        while i <= n, j < target.count {
            if target[j] == i {
                s.append("Push")
                j += 1
            } else {
                s.append(contentsOf: ["Push", "Pop"])
            }
            i += 1
        }
        return s
    }
}

let s = Solution()
s.buildArray([1, 3], 3)
s.buildArray([1, 2, 3], 3)
s.buildArray([1, 2], 4)
s.buildArray([2, 3, 4], 4)

//: [Next](@next)
