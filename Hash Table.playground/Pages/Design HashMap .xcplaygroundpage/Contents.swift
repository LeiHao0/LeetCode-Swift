//: [Previous](@previous)

class MyHashMap {
    
    // 444ms, 74.77%
    private var bucket = Array(repeating: -1, count: 1000001)
    
    func put(_ key: Int, _ value: Int) {
        bucket[key] = value
    }
    
    func get(_ key: Int) -> Int {
        bucket[key]
    }
    
    func remove(_ key: Int) {
        bucket[key] = -1
    }
}

//: [Next](@next)
