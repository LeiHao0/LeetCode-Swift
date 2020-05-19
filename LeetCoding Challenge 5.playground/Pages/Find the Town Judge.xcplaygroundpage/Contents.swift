//: [Previous](@previous)

/**
 # Find the Town Judge

 In a town, there are `N` people labelled from `1` to `N`. There is a rumor that one of these people is secretly the town judge.

 If the town judge exists, then:

 1. The town judge trusts nobody.
 2. Everybody (except for the town judge) trusts the town judge.
 3. There is exactly one person that satisfies properties 1 and 2.

 You are given `trust`, an array of pairs `trust[i] = [a, b]` representing that the person labelled `a` trusts the person labelled `b`.

 If the town judge exists and can be identified, return the label of the town judge. Otherwise, return `-1`.

 **Example 1:**

 ```
 Input: N = 2, trust = [[1,2]]
 Output: 2
 ```

 **Example 2:**

 ```
 Input: N = 3, trust = [[1,3],[2,3]]
 Output: 3
 ```

 **Example 3:**

 ```
 Input: N = 3, trust = [[1,3],[2,3],[3,1]]
 Output: -1
 ```

 **Example 4:**

 ```
 Input: N = 3, trust = [[1,2],[2,3]]
 Output: -1
 ```

 **Example 5:**

 ```
 Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
 Output: 3
 ```

 **Note:**

 1. `1 <= N <= 1000`
 2. `trust.length <= 10000`
 3. `trust[i]` are all different
 4. `trust[i][0] != trust[i][1]`
 5. `1 <= trust[i][0], trust[i][1] <= N`
 */

class Solution {
    // 800ms, 98.04%
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        if trust.count < N - 1 { return -1 }
        var inDegrees = Array(repeating: 0, count: N + 1), outDegrees = inDegrees
        for t in trust {
            outDegrees[t[0]] += 1
            inDegrees[t[1]] += 1
        }
        for i in 1 ... N {
            if inDegrees[i] == N - 1, outDegrees[i] == 0 {
                return i
            }
        }
        return -1
    }

    // 852ms, 52.94%
    func findJudge0(_ N: Int, _ trust: [[Int]]) -> Int {
        var trusts = Array(repeating: 0, count: N + 1), gMax = [1, 0]
        for t in trust {
            trusts[t[1]] += 1
            if trusts[t[1]] > gMax[1] {
                gMax = [t[1], trusts[t[1]]]
            }
        }
        if gMax[1] != N - 1 {
            return -1
        } else {
            let judgeTrusts = trust.filter { $0[0] == gMax[0] }
            return judgeTrusts.isEmpty ? gMax[0] : -1
        }
    }
}

let s = Solution()
s.findJudge(1, []) == 1
s.findJudge(2, [[1, 2]]) == 2
s.findJudge(3, [[1, 3], [2, 3]]) == 3
s.findJudge(3, [[1, 3], [2, 3], [3, 1]]) == -1
s.findJudge(3, [[1, 2], [2, 3]]) == -1
s.findJudge(4, [[1, 3], [1, 4], [2, 3], [2, 4], [4, 3]]) == 3

//: [Next](@next)
