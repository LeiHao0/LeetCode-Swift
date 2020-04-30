//: [Previous](@previous)

/**
 # First Unique Number

 You have a queue of integers, you need to retrieve the first unique integer in the queue.

 Implement the `FirstUnique` class:

 - `FirstUnique(int[] nums)` Initializes the object with the numbers in the queue.
 - `int showFirstUnique()` returns the value of **the first unique** integer of the queue, and returns **-1** if there is no such integer.
 - `void add(int value)` insert value to the queue.

  

 **Example 1:**

 ```
 Input:
 ["FirstUnique","showFirstUnique","add","showFirstUnique","add","showFirstUnique","add","showFirstUnique"]
 [[[2,3,5]],[],[5],[],[2],[],[3],[]]
 Output:
 [null,2,null,2,null,3,null,-1]

 Explanation:
 FirstUnique firstUnique = new FirstUnique([2,3,5]);
 firstUnique.showFirstUnique(); // return 2
 firstUnique.add(5);            // the queue is now [2,3,5,5]
 firstUnique.showFirstUnique(); // return 2
 firstUnique.add(2);            // the queue is now [2,3,5,5,2]
 firstUnique.showFirstUnique(); // return 3
 firstUnique.add(3);            // the queue is now [2,3,5,5,2,3]
 firstUnique.showFirstUnique(); // return -1
 ```

 **Example 2:**

 ```
 Input:
 ["FirstUnique","showFirstUnique","add","add","add","add","add","showFirstUnique"]
 [[[7,7,7,7,7,7]],[],[7],[3],[3],[7],[17],[]]
 Output:
 [null,-1,null,null,null,null,null,17]

 Explanation:
 FirstUnique firstUnique = new FirstUnique([7,7,7,7,7,7]);
 firstUnique.showFirstUnique(); // return -1
 firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7]
 firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3]
 firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3,3]
 firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7,3,3,7]
 firstUnique.add(17);           // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
 firstUnique.showFirstUnique(); // return 17
 ```

 **Example 3:**

 ```
 Input:
 ["FirstUnique","showFirstUnique","add","showFirstUnique"]
 [[[809]],[],[809],[]]
 Output:
 [null,809,null,-1]

 Explanation:
 FirstUnique firstUnique = new FirstUnique([809]);
 firstUnique.showFirstUnique(); // return 809
 firstUnique.add(809);          // the queue is now [809,809]
 firstUnique.showFirstUnique(); // return -1
 ```

  

 **Constraints:**

 - `1 <= nums.length <= 10^5`
 - `1 <= nums[i] <= 10^8`
 - `1 <= value <= 10^8`
 - At most `50000` calls will be made to `showFirstUnique` and `add`.

   Hide Hint #1

 Use doubly Linked list with hashmap of pointers to linked list nodes. add unique number to the linked list. When add is called check if the added number is unique then it have to be added to the linked list and if it is repeated remove it from the linked list if exists. When showFirstUnique is called retrieve the head of the linked list.

   Hide Hint #2

 Use queue and check that first element of the queue is always unique.

   Hide Hint #3

 Use set or heap to make running time of each function O(logn).
 */

class FirstUnique {
    var dict = Dictionary<Int, Int>()
    var arr = [Int]()
    var p = 0
    
    init(_ nums: [Int]) {
        for i in nums {
            add(i)
        }
    }
    
    func showFirstUnique() -> Int {
        for k in p..<arr.count {
            if dict[arr[k]] == 1 {
                p = k
                return arr[p]
            }
        }
        return -1
    }
    
    func add(_ value: Int) {
        arr.append(value)
        if let v = dict[value] {
            dict[value] = v + 1
        } else {
            dict[value] = 1
        }
    }
}

var s = FirstUnique([2,3,5])
s.showFirstUnique() // 2
s.add(5)
s.showFirstUnique() // 2
s.add(2)
s.showFirstUnique() // 3
s.add(3)
s.showFirstUnique() // -1


s = FirstUnique([7,7,7,7,7,7])
s.showFirstUnique(); // return -1
s.add(7);            // the queue is now [7,7,7,7,7,7,7]
s.add(3);            // the queue is now [7,7,7,7,7,7,7,3]
s.add(3);            // the queue is now [7,7,7,7,7,7,7,3,3]
s.add(7);            // the queue is now [7,7,7,7,7,7,7,3,3,7]
s.add(17);           // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
s.showFirstUnique(); // return 17


s = FirstUnique([809]);
s.showFirstUnique(); // return 809
s.add(809);          // the queue is now [809,809]
s.showFirstUnique(); // return -1

s = FirstUnique([]);
s.showFirstUnique(); // return -1
s.add(809);          // the queue is now [809]
s.showFirstUnique(); // return 809

//: [Next](@next)
