import UIKit

// 387. 字符串中的第一个唯一字符

func firstUniqChar(_ s: String) -> Int {
    var dict = [String.Element: Int]()
    for char in s {
        dict[char, default: 0] += 1
    }
    for (idx, c) in s.enumerated() {
        if dict[c] == 1 {
            return idx
        }
    }
    return -1
}
