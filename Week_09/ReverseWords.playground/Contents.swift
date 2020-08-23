import UIKit

// 151. 翻转字符串里的单词

func reverseWords(_ s: String) -> String {
    return s.split { $0.isWhitespace }.reversed().joined(separator: " ")
}
