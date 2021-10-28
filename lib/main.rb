require_relative 'tree'

#array=[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
#array=[1,2,3,4,5,6,7,8,9]
#array=[1,2,4,5,8,10]
#tree=Tree.new(array)
#tree.insert(3)
#tree.delete(1)
#p tree.find(10)
#tree.level_order{|val| p val}
#p tree.level_order()

#tree.preorder{|num| puts num}
#tree.inorder{|num| puts num}
#tree.postorder{|num| puts num}

#p tree.preorder()
#p tree.inorder()
#p tree.postorder()

#tree.height(8)
#p tree.depth(6345)
#p tree.balanced?()
#tree.rebalance()

newArray=(Array.new(15) { rand(1..100) })
newTree=Tree.new(newArray)
p newTree.balanced?()
p newTree.level_order()
p newTree.preorder()
p newTree.postorder()
p newTree.inorder()
newTree.insert(100)
newTree.insert(102)
newTree.insert(101)
newTree.insert(103)
p newTree.balanced?()
newTree.rebalance()
p newTree.balanced?()
p newTree.level_order()
p newTree.preorder()
p newTree.postorder()
p newTree.inorder()