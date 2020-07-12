import UIKit


// 17. 电话号码的字母组合

var result: [String] = []
var dic: [Character: String] = ["2": "abc",
                                "3": "def",
                                "4": "ghi",
                                "5": "jkl",
                                "6": "mno",
                                "7": "pqrs",
                                "8": "tuv",
                                "9": "wxyz"]

func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    let digitsArray = Array(digits)
    combine("", index: 0, digistsArray: digitsArray)
    return result;
}

func combine(_ string: String, index: Int, digistsArray: [Character]) {
    if (index == digistsArray.count) {
        result.append(string)
        return
    }
    
    let char = digistsArray[index] //获取当前层节点数据对应的key
    let letters = dic[char]! //获取当前层的所有节点
    for letter in letters {
        combine(string + String(letter), index: index+1, digistsArray: digistsArray)
    }
}
