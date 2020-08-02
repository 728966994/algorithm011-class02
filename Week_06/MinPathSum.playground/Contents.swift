import UIKit

func minPathSum(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var dp = [[Int]](repeating: [Int](repeating: Int.max, count: n + 1), count: m + 1)
    dp[m][n - 1] = 0
    dp[m - 1][n] = 0
    for i in (0...m - 1).reversed() {
        for j in (0...n - 1).reversed() {
            dp[i][j] = min(dp[i + 1][j], dp[i][j + 1]) + grid[i][j]
        }
    }
    return dp[0][0]
}
