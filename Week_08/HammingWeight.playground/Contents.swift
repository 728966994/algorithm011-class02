import UIKit

// 191. 位1的个数

func hammingWeight(_ n: Int) -> Int {
    var n = n
    var res: Int = 0
    for _ in 0..<32 {
        res += (n & 1)
        n = n >> 1
    }
    return res
}
