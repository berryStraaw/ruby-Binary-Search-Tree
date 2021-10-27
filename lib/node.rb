class Node
    attr_accessor :value
    attr_accessor :left_node
    attr_accessor :right_node

    def initialize(value=nil,left_node=nil, right_node=nil)
        @value=value
        @left_node=left_node
        @right_node=right_node
    end
end