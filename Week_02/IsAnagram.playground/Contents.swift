import UIKit

// 242. 有效的字母异位词

/**
 排序、比较数组
 */
func test1(_ s: String, _ t: String) -> Bool {
    if s.count != t.count{
        return false;
    }
    
    return s.sorted() == t.sorted();
}

/**
 字母计数器
 */
func test2(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var counter = [Int](repeating: 0, count: 26)
    let aCharUnicodeScalar = Int("a".unicodeScalars.first!.value)
    for scalar in s.unicodeScalars {
        counter[Int(scalar.value) - aCharUnicodeScalar] += 1
    }
    for scalar in t.unicodeScalars {
        counter[Int(scalar.value) - aCharUnicodeScalar] -= 1
    }
    
    guard counter.first(where: { $0 != 0 }) == nil else { return false }
    return true
}


