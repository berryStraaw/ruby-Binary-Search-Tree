require_relative 'tree'

array=[1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
array=[1,2,3,4,5,6,7,8,9]
array=[1,2,4,5,8,10]
tree=Tree.new(array)
#tree.insert(3)
#tree.delete(1)
p tree.find(10)