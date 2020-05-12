//: [Previous](@previous)

class Solution {
    // 292 ms, 64.73%
    func sortedSquares(_ A: [Int]) -> [Int] {
        let m = Int(A.firstIndex(where: {$0 >= 0 }) ?? 0)
        var arr = Array(repeating: 0, count: A.count),  i = 0, j = 0, k = 0
        let a = A.map({$0*$0})
        let a0 = Array(a[..<m].reversed()), a1 = Array(a[m...])
        while i < a0.count, j < a1.count {
            if a0[i] < a1[j] {
                arr[k] = a0[i]
                i += 1
            } else {
                arr[k] = a1[j]
                j += 1
            }
            k += 1
        }
        while i < a0.count {
            arr[k] = a0[i]
            i += 1
            k += 1
        }
        while j < a1.count {
            arr[k] = a1[j]
            j += 1
            k += 1
        }
        return arr
    }
}

//: [Next](@next)
