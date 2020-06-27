import Foundation

class Solution {
    
    // 暴力破解,两层for循环.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (currentIndex, currentNum) in nums.enumerated() {
            for remainderIndex in currentIndex ..< nums.count {
                if ((currentNum + nums[remainderIndex]) == target) && (currentIndex != remainderIndex) {
                    return [currentIndex, remainderIndex]
                }
            }
        }
        return []
    }
    
    // Hash
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            let remainder = target - num
            if (dic.keys.contains(remainder)) {
                if let remainderIndex = dic[remainder], remainderIndex != index {
                    return [remainderIndex, index]
                }
            }
            dic[num] = index
        }
        return []
    }
}
