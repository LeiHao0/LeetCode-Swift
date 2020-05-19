//: [Previous](@previous)

/**
 # Implement Trie (Prefix Tree)

 Implement a trie with `insert`, `search`, and `startsWith` methods.

 **Example:**

 ```
 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 ```

 **Note:**

 - You may assume that all inputs are consist of lowercase letters `a-z`.
 - All inputs are guaranteed to be non-empty strings.
 */

class Trie {
    // 292ms, 82.68%
    func insert(_ word: String) {
        var node = root
        for c in word {
            node = node.get(c) ?? node.set(c, TrieNode())
        }
        node.isEnd = true
    }

    func search(_ word: String) -> Bool {
        return searchPrefix(word)?.isEnd ?? false
    }

    func startsWith(_ prefix: String) -> Bool {
        return searchPrefix(prefix) != nil
    }

    private let root = TrieNode()
    private func searchPrefix(_ word: String) -> TrieNode? {
        var node = root
        for c in word {
            guard let v = node.get(c) else { return nil }
            node = v
        }
        return node
    }

    private class TrieNode {
        var isEnd = false
        func get(_ c: Character) -> TrieNode? { return links[c2i(c)] }
        func set(_ c: Character, _ t: TrieNode) -> TrieNode { links[c2i(c)] = t; return t }

        private var links: [TrieNode?] = Array(repeating: nil, count: 26)
        private func c2i(_ c: Character) -> Int { return Int(c.asciiValue! - Character("a").asciiValue!) }
    }
}

let obj = Trie()
let word = "word"
obj.insert(word)
let ret_2: Bool = obj.search(word)
let ret_3: Bool = obj.startsWith("prefix")

//: [Next](@next)
