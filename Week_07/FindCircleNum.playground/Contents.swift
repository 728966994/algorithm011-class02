import UIKit

/**
 547. 朋友圈
 */

class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        
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
        
        for indx in 0..<M.count{
            for indy in 0..<M[0].count{
                if M[indx][indy] == 1 {
                    union(p: indx, q: indy)
                }
            }
        }
        
        return count
    }
}

