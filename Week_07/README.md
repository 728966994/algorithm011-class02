## 字典树
基本概念：

字典树，即 Trie 树，又称单词查找树或键树，是一种树形结构。典型应用是用于统计和排序大量的字符串（但不仅限于字符串）， 所以经常被搜索引擎系统用于文本词频统计。 它的优点是：最大限度地减少无谓的字符串比较，查询效率比哈希表高。

基本性质：
* 结点本身不存完整单词
* 从根结点到某一结点，路径上经过的字符连接起来，为该结点对应的字符串
* 每个结点的所有子结点路径代表的字符都不相同

核心思想：

空间换时间，利用字符串的公共前缀来降低查询时间的开销以达到提高效率的目的。

代码模板：

```js
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
```
## 并查集
基本操作：
* makeSet(s)：建立一个新的并查集，其中包含 s 个单元素集合
* unionSet(x, y)：把元素 x 和元素 y 所在的集合合并，要求 x 和 y 所在的集合不相交，如果相交则不合并
* ﬁnd(x)：找到元素 x 所在的集合的代表，该操作也可以用于判断两个元素是否位于同一个集合，只要将它们各自的代表比较一下就可以了

代码模板：

```js
class UnionFind {
        //初始化
        var count = M.count
        var parent = [Int](repeating: 0, count: count)
        var size = [Int](repeating: 0, count: count)
        
        for indx in 0..<count {
            parent[indx] = indx
            size[indx] = 1
        }
        
        //查找操作
        func find(x : Int) -> Int{
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }

        //归并操作
        func union(p : Int, q: Int){
            let rootP = find(x: p)
            let rootQ = find(x: q)
            if rootP == rootQ {
                return
            }

            if size[rootP] > size[rootQ] {
                parent[rootQ] = rootP
                size[rootP] += size[rootQ]
            }else{
                parent[rootP] = rootQ
                size[rootQ] += size[rootP]
            }

            count -= 1
        }
}
```
## 高级搜索
**剪枝**

在进行状态树搜索时，如果发现这个分支是已经处理过的，就把它暂存在缓存里面，整个分支就可以剪掉。 或者可以剪掉比较差的分支或次优的分支。

**双向BFS**

两端同时进行BFS，第一次重合的地方即为两者之间最短路径，左边步数加上右边步数即为总步数。

**启发式搜索（Heuristic Search)（A*)**

启发式函数： h(n)，它用来评价哪些结点最有希望的是一个我们要找的结点，h(n) 会返回一个非负实数,也可以认为是从结点n的目标结点路径的估计成本。

启发式函数是一种告知搜索方向的方法。它提供了一种明智的方法来猜测哪个邻居结点会导向一个目标。

## AVL树、红黑树
**AVL树**

* 平衡二叉搜索树；
* Balance Factor（平衡因子）： 是它的左子树的高度减去它的右子树的高度（有时相反）。 balance factor = {-1, 0, 1}；
* 通过旋转操作来进行平衡（四种）：左旋（右右子树）、右旋（左左子树）、左右旋（左右子树）、右左旋（右左子树）。

不足：结点需要存储额外信息、且调整次数频繁。

**红黑树**

红黑树是一种近似平衡的二叉搜索树（BinarySearch Tree），它能够确保任何一个结点的左右子树的高度差小于两倍。 具体来说，红黑树是满足如下条件的二叉搜索树：

* 每个结点要么是红色，要么是黑色；
* 根结点是黑色；
* 每个叶结点（NIL结点，空结点）是黑色的；
* 不能有相邻接的两个红色结点；
* 从任一结点到其每个叶子的所有路径都包含相同数目的黑色结点。
* 关键性质：从根到叶子的最长的可能路径不多于最短的可能路径的两倍长。

**AVL树与红黑树对比：**

* AVL trees provide faster lookups than Red Black Trees because they are more strictly balanced.
* Red Black Trees provide faster insertion and removal operations than AVL trees as fewer rotations are done due to relatively relaxed balancing.
* AVL trees store balance factors or heights with each node, thus requires storage for an integer per node whereas Red Black Tree requires only 1 bit of information per node.
* Red Black Trees are used in most of the language libraries like map,multimap,multi set in C++ whereas AVL trees are used in databases where faster retrievals are required.