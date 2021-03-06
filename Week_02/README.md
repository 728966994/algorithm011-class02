学习笔记
* 本周学习的数据结构
    * 哈希表、映射、集合
    * 树、二叉树、二叉搜索树
    * 堆和二叉堆、图

* 哈希表
    * 根据键值码而直接进行访问的数据结构
    * 查询、添加、删除O(1) 退化成链表O(n)

* 集合
    * 不允许出现重复元素，并且无序的
    * 底层实现基于哈希表

* 树
    * 基本结构：左右或者多叉，以二叉为多数，牢记遍历方式， 中序和前序需要熟练写出迭代遍历方式；时间复杂度O(N);
    * 特殊结构： 二叉搜索树， 在树的基础上维护了类似于堆的顺序，但是左右子树都符合这个规则，可以利用中序遍历获得升序序列；搜索一个值的时间复杂度O(logN);

* 堆
    * 父亲节点大于其子节点的值，但是遍历结果并不一定有序；但是可以利用堆为大顶堆或者小顶堆的性质，快速获得最值
    * 查找最大或者最小值时间复杂度为O(1)，插入和删除元素时的时间复杂度为O(logn)

* 图
    * Graph(V, E) --> 有点 Vertex、有边 Edge
    * V-Vertex -> 点  
      * 度：入度 和 出度
      * 联通性：点与点之间联通与否
    *  E-Edge: 边
        * 有向和无向：单行线
      * 权重：边长