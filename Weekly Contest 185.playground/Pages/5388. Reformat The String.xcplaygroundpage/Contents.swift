//: [Previous](@previous)

class Solution {
    func reformat(_ s: String) -> String {
        var digs = [Character](), ints = [Character](), sv = ""
        s.forEach { c in
            if Int(String(c)) != nil {
                ints.append(c)
            } else {
                digs.append(c)
            }
        }
        
        if abs(digs.count - ints.count) > 1 { return "" }
        
        if digs.count > ints.count {
            var i = 0
            while i < ints.count {
                sv.append(digs[i])
                sv.append(ints[i])
                i += 1
            }
            sv.append(digs[i])
        } else if digs.count < ints.count {
            var i = 0
            while i < digs.count {
                sv.append(ints[i])
                sv.append(digs[i])
                i += 1
            }
            sv.append(ints[i])
        } else {
            var i = 0
            while i < digs.count {
                sv.append(digs[i])
                sv.append(ints[i])
                i += 1
            }
        }
        
        return sv
    }
}

let s = Solution()
s.reformat("ab123")
s.reformat("")
s.reformat("a1")
s.reformat("1")
s.reformat("a0b1c2")
s.reformat("leetcode")
s.reformat("1229857369")
s.reformat("covid2019")
s.reformat("ab123")


//: [Next](@next)
