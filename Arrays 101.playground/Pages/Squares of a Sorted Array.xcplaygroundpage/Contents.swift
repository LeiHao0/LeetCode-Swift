//: [Previous](@previous)

class Solution {
    // 264ms, 89.27%
    func sortedSquares(_ A: [Int]) -> [Int] {
        var i = 0, j = 0, k = 0, ans = A
        while j < A.count, A[j] < 0 {
            j += 1
        }
        i = j - 1

        while i >= 0, j < A.count {
            let (ai, aj) = (A[i] * A[i], A[j] * A[j])
            ai < aj ? (ans[k] = ai, i -= 1) : (ans[k] = aj, j += 1)
            k += 1
        }
        while i >= 0 {
            ans[k] = A[i] * A[i]
            i -= 1
            k += 1
        }
        while j < A.count {
            ans[k] = A[j] * A[j]
            j += 1
            k += 1
        }
        return ans
    }

    // 264ms, 89.27%
    func sortedSquares1(_ A: [Int]) -> [Int] {
        var i = 0, j = 0, k = 0, ans = A
        while j < A.count, A[j] < 0 {
            j += 1
        }
        i = j - 1

        while i >= 0, j < A.count {
            let (ai, aj) = (A[i] * A[i], A[j] * A[j])
            ai < aj ? (ans[k] = ai, i -= 1) : (ans[k] = aj, j += 1)
            k += 1
        }

        return ans
    }

    // 292 ms, 64.73%
    func sortedSquares0(_ A: [Int]) -> [Int] {
        let m = Int(A.firstIndex(where: { $0 >= 0 }) ?? 0)
        var arr = Array(repeating: 0, count: A.count), i = 0, j = 0, k = 0
        let a = A.map { $0 * $0 }
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

let s = Solution()
s.sortedSquares([-4, -1, 0, 3, 10])
s.sortedSquares([-7, -3, 2, 3, 11])

//: [Next](@next)
