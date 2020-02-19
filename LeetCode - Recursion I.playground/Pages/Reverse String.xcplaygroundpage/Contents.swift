class Solution {
    func reverseString(_ s: inout [Character]) {
        s.reverse()
    }
}

let s = Solution()
var a:[Character] = ["h","e","l","l","o"]
s.reverseString(&a)
print(a)
a = ["a"]
s.reverseString(&a)
print(a)
a = []
s.reverseString(&a)
print(a)

a = ["H","a","n","n","a","h"]
s.reverseString(&a)
print(a)
