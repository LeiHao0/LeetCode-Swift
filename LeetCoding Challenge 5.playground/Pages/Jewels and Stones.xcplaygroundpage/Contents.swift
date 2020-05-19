//: [Previous](@previous)

/**
 # Jewels and Stones

 You're given strings `J` representing the types of stones that are jewels, and `S` representing the stones you have. Each character in `S` is a type of stone you have. You want to know how many of the stones you have are also jewels.

 The letters in `J` are guaranteed distinct, and all characters in `J` and `S` are letters. Letters are case sensitive, so `"a"` is considered a different type of stone from `"A"`.

 **Example 1:**

 ```
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 ```

 **Example 2:**

 ```
 Input: J = "z", S = "ZZ"
 Output: 0
 ```

 **Note:**

 - `S` and `J` will consist of letters and have length at most 50.
 - The characters in `J` are distinct.

   Hide Hint #1

 For each stone, check if it is a jewel.

 */

class Solution {
    // 4ms, 96.23%
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let j = Set(J)
        var v = 0
        for c in S {
            if j.contains(c) {
                v += 1
            }
        }
        return v
    }

    // 8ms, 76.89%
    func numJewelsInStones0(_ J: String, _ S: String) -> Int {
        let j = Set(J)
        return S.reduce(0) { j.contains($1) ? $0 + 1 : $0 }
    }
}

//: [Next](@next)
