import UIKit

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 else { return 0 }

        var maxSide = 0
        var dp = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)

        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                guard matrix[i][j] == "1" else { continue }
                
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]) + 1
                }
                
                maxSide = max(maxSide, dp[i][j])
            }
        }

        return maxSide * maxSide
    }
}
