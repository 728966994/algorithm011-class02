#### 高级动态规划
感触：
* 人肉递归低效、很累
* 找到最近最简方法，将其拆解成可重复解决的问题
* 数学归纳法思维

本质：寻找重复性 —> 计算机指令集

动态规划：
* Simplifying a complicated problem by breaking it down into simpler sub-problems” (in a recursive manner)
* Divide & Conquer + Optimal substructure 分治 + 最优子结构
* 顺推形式： 动态递推

#### 字符串算法
基本操作
* 遍历
* 比较
* 操作

常见问题
* Atoi
* Anagram异位词
* Palindrome回文串
* 最长字串、子序列

字符串匹配算法
* 暴力法 O(mn)

* Rabin-Karp算法

* 假设子串的长度为 M (pat)，目标字符串的长度为 N (txt)
    * 计算子串的 hash 值 hash_pat
    * 计算目标字符串txt中每个长度为 M 的子串的 hash 值（共需要计算 N-M+1 次）
    * 比较 hash 值：如果 hash 值不同，字符串必然不匹配; 如果 hash 值相同， 还需要使用朴素算法再次判断
* KMP算法
    * 当子串与目标字符串不匹配时，利用已经匹配成功部分的已知信息，不要把“搜索位 置” 移回已经比较过的位置，继续把它向后移，这样就提高了效率。

* Boyer-Moore算法

* Sunday算法