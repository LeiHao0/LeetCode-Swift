//: [Previous](@previous)

/**
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 - push(x) -- Push element x onto stack.
 - pop() -- Removes the element on top of the stack.
 - top() -- Get the top element.
 - getMin() -- Retrieve the minimum element in the stack.

  

 **Example:**

 ```
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
 ```
 */


//Runtime: 100 ms
//Memory Usage: 22.1 MB
//74.66
class MinStack {
    private var minStack = ([Int](), [Int]())
    
    func push(_ x: Int) {
        minStack.0.append(x)
        minStack.1.append(min(minStack.1.last ?? Int.max, x))
    }
    
    func pop() {
        minStack.0.popLast()
        minStack.1.popLast()
    }
    
    func top() -> Int {
        return minStack.0.last ?? 0
    }
    
    func getMin() -> Int {
        return minStack.1.last ?? 0
    }
}

let minStack = MinStack()
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // --> Returns -3.
minStack.pop();
minStack.top();    // --> Returns 0.
minStack.getMin(); // --> Returns -2.

//: [Next](@next)
