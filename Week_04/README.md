## 广度优先遍历（BFS）
**概念**

广度优先遍历(Breadth First Search),又叫宽度优先遍历或横向优先遍历，是从根结点开始沿着树的宽度搜索遍历
    
**代码模板**

```js
function bfs(graph, start, end) {
  const visited = [];
  const queue = [];
  queue.push(start);
  while (!queue.length) {
    const node = queue.shift();
    visited.push(node);
    // process node
    // 再讲node的子节点一次放入队列
    const nodes = generator_nodes(node);
    queue.push(nodes);
  }
}
```

## 深度优先遍历（DFS）
**概念**

深度优先搜索(Depth First Search)是沿着树的深度遍历树的节点，尽可能深的搜索树的分支

**代码模板**

```js
const visited = [];
function dfs(node, visited) {
  // terminator
  if (visited.includes(node)) return;
  visited.push(node);
  // process...

  // drill down
  for (child in root.children) {
    if (visited.includes(child)) continue;
    dfs(child, visited);
  }
}
```
## 贪心算法
**概念**

贪心算法是一种在每一步选择中都采取在当前状态下最好或最优（即最有 利）的选择，从而希望导致结果是全局最好或最优的算法。

**和动态规划的异同点**

贪心算法与动态规划的不同在于它对每个子问题的解决方案都做出选择，不能回退。动态规划则会保存以前的运算结果，并根据以前的结果对当前进行选择，有回退功能。

## 二分查找
**前提条件**
* 目标函数单调性（单调递增或递减）
* 存在上下界（bounded）
* 能够通过索引访问（index accessible）

**代码模板**

```js
function binarySearch(array, target) {
  var left = 0, right = array.length - 1;
  while (left <= right) {
    let mid = (left + right) / 2;
    if (array[mid] === target) {
      // find result
      break;
    } else if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
}
```