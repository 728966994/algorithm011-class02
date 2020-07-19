import UIKit

// 122. 买卖股票的最佳时机

func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0;
    for i in 1..<prices.count {
        if prices[i] > prices[i-1] {
            maxProfit += prices[i] - prices[i-1]
        }
    }
    return maxProfit;
}
