**本周知识要点**
*   递归：递归就是自己调用自己，把一个问题分解成可以同样操作的子问题
*   分治：将一个事物分成许多个小部分，分而治之，最后进行合并
*   回溯：采用试错的思想，它尝试分步的去解决一个问题。在分步解决问题的过程中， 当它通过尝试发现现有的分步答案不能得到有效的正确的解答的时候，它将取消 上一步甚至是上几步的计算，再通过其它的可能的分步解答再次尝试寻找问题的答案

**思维要点**
*   不要进行人肉递归（最大误区）
*   找到最近最简方法，将其拆解成可重复解决的问题（重复子问题）
*   数学归纳法思维

**递归代码模板**
```js
func recursive(level, param int) {
  // terminator
  if level > maxLevel {
    // process result
    return 
  }
  // process current logic 
  process(level, param)
  
  // drill down
  recursive(level+1,newParam)
  
  // restore current status
}
```
**分治代码模板**

```js
func divideConquer(problem, param1, param2, ...) {
    // recursion terminator
    if(problem == null) {
        // deal with result
        return;
    }
   
    // prepare data
    data = prepareData(problem);
    subProblems = spiltProblem(problem, data);
   
    // conquer subProblems
    subResult1 = divideConquer(subProblems[0], p1, p2, ...);
    subResult2 = divideConquer(subProblems[1], p1, p2, ...);
    subResult3 = divideConquer(subProblems[2], p1, p2, ...);
    ...
    // process and generate the final result 
    result = processResult(subResult1, subResult2, subResult3, ...)
    
    // revert the current level states
}
```