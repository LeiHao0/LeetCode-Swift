public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


public class BinaryMatrix {
    var arr = [[Int]]()
    
    public init(_ arr: [[Int]]) {
        self.arr = arr
    }
    
    public func get(_ x: Int, _ y: Int) -> Int {
        return arr[x][y]
    }
    
    public func dimensions() -> [Int] {
        return [arr.count, arr[0].count]
    }
};
