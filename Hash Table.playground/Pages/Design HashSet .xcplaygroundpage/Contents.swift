//: [Previous](@previous)

class MyHashSet {
    
    // 392ms, 79.17%
    private var bucket = Array(repeating: false, count: 1000001)
    
    func add(_ key: Int) {
        bucket[key] = true
    }

    func remove(_ key: Int) {
         bucket[key] = false
    }
    
    func contains(_ key: Int) -> Bool {
        return bucket[key]
    }
}

//: [Next](@next)
