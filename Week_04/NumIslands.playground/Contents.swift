import UIKit

// 200. 岛屿数量

func numIslands(_ grid: [[Character]]) -> Int {
    let n = grid.count
    guard n > 0 else {
        return 0
    }
    let m = grid[0].count
    
    var copyGrid = grid
    func dfs(_ i: Int,_ j:Int) {
        guard i >= 0 && i < n && j >= 0 && j < m && copyGrid[i][j] == "1" else{
            return
        }
        copyGrid[i][j] = "0"
        dfs(i-1, j)//上
        dfs(i+1, j)//下
        dfs(i, j-1)//左
        dfs(i, j+1)//右
    }
    
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if copyGrid[i][j] == "1" {
                count += 1
                dfs(i, j)
            }
        }
    }
    return count
}

