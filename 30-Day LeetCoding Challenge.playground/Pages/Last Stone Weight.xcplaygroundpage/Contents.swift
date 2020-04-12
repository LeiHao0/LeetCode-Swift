//: [Previous](@previous)

/**
 Last Stone Weight

 We have a collection of stones, each stone has a positive integer weight.

 Each turn, we choose the two **heaviest** stones and smash them together. Suppose the stones have weights `x` and `y` with `x <= y`. The result of this smash is:

 - If `x == y`, both stones are totally destroyed;
 - If `x != y`, the stone of weight `x` is totally destroyed, and the stone of weight `y` has new weight `y-x`.

 At the end, there is at most 1 stone left. Return the weight of this stone (or 0 if there are no stones left.)

  

 **Example 1:**

 ```
 Input: [2,7,4,1,8,1]
 Output: 1
 Explanation:
 We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
 we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
 we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
 we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
 ```

  

 **Note:**

 1. `1 <= stones.length <= 30`
 2. `1 <= stones[i] <= 1000`

   Hide Hint #1

 >Simulate the process.  We can do it with a heap, or by sorting some list of stones every time we take a turn.
 */

class Solution {
    //    Runtime: 8 ms, 95.83%
    //    Memory Usage: 21.3 MB
    func lastStoneWeight(_ stones: [Int]) -> Int {
        if stones.count < 2 { return stones.first ?? 0 }
        
        var s = stones, m0 = (0, 0), m1 = (0, 0)
        for (i, v) in stones.enumerated() {
            if v > m0.1 {
                m1 = m0
                m0 = (i, v)
            } else if v > m1.1 {
                m1 = (i, v)
            }
        }
        
        s.remove(at: m0.0)
        s.remove(at: m1.0 - (m0.0 > m1.0 ? 0 : 1))
        
        return lastStoneWeight(m0.1-m1.1 == 0 ? s : s + [m0.1-m1.1])
    }
    
    //    Runtime: 16 ms, 12.5%
    //    Memory Usage: 21.8 MB
    func lastStoneWeight0(_ stones: [Int]) -> Int {
        if stones.count < 2 { return stones.first ?? 0 }
        let stones = stones.sorted { $0 > $1 }
        
        let d = stones[0]-stones[1]
        let a = Array(stones[2...])
        
        return lastStoneWeight0(d == 0 ? a : a + [d])
    }
}

let s = Solution()
s.lastStoneWeight([2,7,4,1,8,1]) // 1
s.lastStoneWeight([4,3,4,3,2]) // 1

//: [Next](@next)
