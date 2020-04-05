//: [Previous](@previous)

//Runtime: 4 ms
//Memory Usage: 20.8 MB
//92.86%

class Solution {
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        var dic = [Int:Double]()
        dic[-1] = 1/x; dic[0] = 1; dic[1] = x
        
        return fastPow(x, n, &dic)
    }
    
    
    func fastPow(_ x: Double, _ n: Int, _ arr: inout [Int:Double]) -> Double {
        if let v = arr[n] { return v }
        
        let l = n / 2, r = n - l
        
        if arr[l] == nil {
            arr[l] = fastPow(x, l, &arr)
        }
        if arr[r] == nil {
            arr[r] = fastPow(x, r, &arr)
        }
        
        return arr[l]! * arr[r]!
    }
}


let s = Solution()
s.myPow(2, 10)
s.myPow(2.1, 3)
s.myPow(2, -2)
s.myPow(0, -2)
s.myPow(0, 1)
s.myPow(0, 2)
s.myPow(1, 0)
s.myPow(2, 0)
s.myPow(-2, 0)
s.myPow(2, 1)
s.myPow(2, -1)
s.myPow(0, -1)
s.myPow(1, 2147483647)
s.myPow(-1, 2147483647)


//: [Next](@next)
