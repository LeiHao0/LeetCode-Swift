//: [Previous](@previous)

// Runtime: 8 ms
// Memory Usage: 20.7 MB

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var arr = [1], j = 0
        for _ in 0 ..< rowIndex {
            arr.append(1)
            j = arr.count - 2
            while j > 0 {
                arr[j] += arr[j - 1]
                j -= 1
            }
        }
        return arr
    }
}

let s = Solution()
for i in 0 ..< 5 {
    print(s.getRow(i))
}

//: [Next](@next)
