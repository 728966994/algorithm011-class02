import Foundation

class Solution {
    /**
     删除排序数组中的重复项
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 { return 0 }
        // i为慢指针，代表不同值的下标
        var i = 0
        // j为快指针
        for j in 1..<nums.count {
            // 如果慢指针值不等于快指针值
            if nums[j] != nums[i] {
                // 慢指针+1
                i += 1
                // 把不同值赋值给对应慢指针下标
                nums[i] = nums[j]
            }
        }
        return i+1
    }
}
