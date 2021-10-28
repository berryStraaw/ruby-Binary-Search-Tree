require_relative 'node'

class Tree
    attr_accessor :root

    def initialize(arr)
        arr.sort!().uniq!
        @root=build_tree(arr,0,arr.length-1)
    end

    def build_tree(arr,start,arEnd)
        return nil if start>arEnd
        mid=(start+arEnd)/2
        node=Node.new(arr[mid])
        node.left_node=build_tree(arr,start, mid-1)
        node.right_node=build_tree(arr,mid+1, arEnd)
        return node
    end

    def insert(val)
        node=@root
        while node.left_node!=nil || node.right_node!=nil
            if val<node.value
                if node.left_node==nil
                    break
                end
                node=node.left_node
            elsif val>node.value
                if node.right_node==nil
                    break
                end
                node=node.right_node
            end
        end
        if val<node.value
            node.left_node=Node.new(val)
        elsif val>node.value
            node.right_node=Node.new(val)
        end
    end
    
    def delete(val)
        node=@root
        prev=node
        while node.value!=val
            if val<node.value
                prev=node
                node=node.left_node
            else
                prev=node
                node=node.right_node
            end
        end
        if node.left_node==nil && node.right_node==nil
            if prev.left_node.value==val
                prev.left_node=nil
            else
                prev.right_node=nil
            end
        
        elsif node.left_node!=nil && node.right_node!=nil
            prev=node
            node=node.right_node
            prevtemp=node
            while node.left_node!=nil
                prevtemp=node
                node=node.left_node
            end
            prevtemp.left_node=nil
            prev.value=node.value

        else
            node.value=node.left_node.value if node.left_node!=nil
            node.value=node.right_node.value if node.right_node!=nil
            node.left_node=nil
            node.right_node=nil
        end
    end

    def find(val)
        node=@root
        while node.value!=val
            if val<node.value
                node=node.left_node
            else
                node=node.right_node
            end
        end
        return node
    end

    def level_order(&block)
        que=[@root]
        arr=[]
        while !que.empty?
            current=que[0]
            que.push(current.left_node,current.right_node)
            if block_given?
                block.call(current.value)
            else
                arr<<current.value
            end
            que.compact!
            que.shift
        end
        arr
    end
    def inorder(arr=[],tree=@root,&block)
        return if tree==nil
        if block_given?
            inorder(arr,tree.left_node,&block)
            block.call(tree.value)
            inorder(arr,tree.right_node,&block)
        else
            arr<<inorder(arr,tree.left_node,&block)
            arr<<tree.value
            inorder(arr,tree.right_node,&block)
            arr=arr.select{|item| item unless item.kind_of?(Array)}
        end
        
    end

    def preorder(arr=[],tree=@root,&block) 
        return if tree==nil
        if block_given?
            block.call(tree.value)
            preorder(arr,tree.left_node,&block)
            preorder(arr,tree.right_node,&block)
        else
            arr<<tree.value
            arr<<preorder(arr,tree.left_node,&block)
            arr<<preorder(arr,tree.right_node,&block)
            arr=arr.select{|item| item unless item.kind_of?(Array)}
        end
        
    end

    def postorder(arr=[],tree=@root,&block)
        return if tree==nil
        postorder(arr,tree.left_node,&block)
        postorder(arr,tree.right_node,&block)
        if block_given?
            block.call(tree.value)
        else
            arr<<tree.value
        end
    end

    def height(node,h=0, new=0)
        node=find(node) if node.kind_of?(Numeric)
        if node.left_node==nil && node.right_node==nil
            h
        elsif node.right_node!=nil
            h+=1
            if new>h
                h=new
            end
            new=height(node.right_node,h)
        elsif node.left_node!=nil
            h+=1
            if new>h
                h=new
            end
            new=height(node.left_node,h)
        end
    end

    def depth(val,d=0)
        node=@root
        while node.value!=val
            if val<node.value
                d+=1
                node=node.left_node
            else
                d+=1
                node=node.right_node
            end
        end
        return d
    end

    def balanced?()
        lh=height(@root.left_node)
        rh=height(@root.right_node)
        diff=lh-rh if lh==rh
        diff=lh-rh if lh>rh
        diff=rh-lh if lh<rh
        return diff<2
    end

    def rebalance()
        newArray=level_order()
        newArray.sort!().uniq!
        @root=build_tree(newArray,0,newArray.length-1)
    end
end
