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
                node=node.left_node
            else
                node=node.right_node
            end
        end
        if val<node.value
            node.left_node=Node.new(val)
        else
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
end