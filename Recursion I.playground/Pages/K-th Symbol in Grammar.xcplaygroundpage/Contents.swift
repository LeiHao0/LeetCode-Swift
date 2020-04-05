//: [Previous](@previous)

//70.59%
//Runtime: 4 ms
//Memory Usage: 20.6 MB


class Solution {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        if N < 2 { return 0 }
        return (kthGrammar(N-1, (K+1)/2) == 0) ? 1-K%2 : K%2
    }
}

let s = Solution()
s.kthGrammar(1, 1)
s.kthGrammar(2, 1)
s.kthGrammar(2, 2)
s.kthGrammar(4, 5)
s.kthGrammar(15, 32)
s.kthGrammar(30, 323241)



//: [Next](@next)
