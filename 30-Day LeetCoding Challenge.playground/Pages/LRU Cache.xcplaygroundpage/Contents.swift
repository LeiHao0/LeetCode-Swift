//: [Previous](@previous)


/**
 # LRU Cache

 Design and implement a data structure for [Least Recently Used (LRU) cache](https://en.wikipedia.org/wiki/Cache_replacement_policies#LRU). It should support the following operations: `get` and `put`.

 `get(key)` - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 `put(key, value)` - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

 The cache is initialized with a **positive** capacity.

 **Follow up:**
 Could you do both operations in **O(1)** time complexity?

 **Example:**

 ```
 LRUCache cache = new LRUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 ```
 */

class LRUCache {

    var dict = [Int: Int]()
    var keys = [Int]()
    var p = 0
    var capacity = 0
    
    init(_ capacity: Int) {
        p = 0
        dict = [:]
        keys = []
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        return dict[key] ?? -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if dict[key] != nil {
            dict[key] = value
        } else {
            if keys.count < capacity {
                keys.append(key)
                dict[key] = value
                p += 1
            } else {
                dict.removeValue(forKey: keys[p-1])
                keys[p-1] = key
                dict[key] = value
                p -= 1
            }
        }
    }
}

let c = LRUCache(2);
c.put(1, 1);
c.put(2, 2);
c.get(1);       // returns 1
c.put(3, 3);    // evicts key 2
c.get(2);       // returns -1 (not found)
c.put(4, 4);    // evicts key 1
c.get(1);       // returns -1 (not found)
c.get(3);       // returns 3
c.get(4);       // returns 4


//: [Next](@next)

