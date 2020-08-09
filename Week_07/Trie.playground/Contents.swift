import UIKit

/**
 208. 实现 Trie (前缀树)
 */

class Trie {
    static let TRIE_NODE_NUMS = 26
    static let a_ASCII_VALUE = Int(Character("a").asciiValue ?? 97)

    class TrieNode {
        var isEnd = false
        var links: [TrieNode?] = [TrieNode?](repeating:nil, count:TRIE_NODE_NUMS)

        init(){}

        func containsKey(_ char: Character) -> Bool {
            guard let asciiValue = char.asciiValue else {
                return false
            }

            let charAt = Int(asciiValue) - a_ASCII_VALUE
            return links[charAt] != nil
        }

        func get(_ char: Character) -> TrieNode? {
            guard let asciiValue = char.asciiValue else {
                return nil
            }

            let charAt = Int(asciiValue) - a_ASCII_VALUE
            return links[charAt]
        }

        func put(_ char: Character, _ node: TrieNode) {
            guard let asciiValue = char.asciiValue else {
                return
            }
            
            let charAt = Int(asciiValue) - a_ASCII_VALUE
            links[charAt] = node
        }
    }

    var root = TrieNode()
    
    init() {

    }
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if !node.containsKey(char) {
                node.put(char, TrieNode())
            }
            node = node.get(char)!
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        guard let node = searchPrefix(word) else {
            return false
        }
        return node.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard searchPrefix(prefix) != nil else {
            return false
        }
        return true
    }

    func searchPrefix(_ word: String) -> TrieNode? {
        var node = root
        for char in word {
            if node.containsKey(char) {
                node = node.get(char)!
            } else {
                return nil
            }
        }
        return node
    }
}

