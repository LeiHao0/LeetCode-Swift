import Foundation

// Code inside modules can be shared between pages and other source files.


extension ListNode {
    public func show() {
        print(ShowList(self))
    }
}

public func ShowList(_ head: ListNode?) -> String {
    var p = head
    var str = ""
    while p != nil {
        str += "\(p!.val) -> "
        p = p?.next
    }
    return "\(str)nil\n"
}

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
