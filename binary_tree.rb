require_relative "merge_sort.rb"

class Node 

    attr_reader :value
    attr_accessor :parent_node, :right_child, :left_child

    def initialize(value, parent_node = nil)
        @value = value
        @parent_node = parent_node
    end

    def display
        puts "Value: #{@value}"
        puts "Parent Node: #{@parent_node}" unless @parent_node == nil
        puts "Left Child Value: #{left_child.value}" unless left_child == nil
        puts "Right Child Value: #{right_child.value}" unless right_child == nil
    end

end

class BST

    def initialize(array)

        @tree = []
        @root = nil
        array = merge_sort(array)
        build_tree(array)

    end


    def build_tree(array)
        
        #build each value into a Node
        @root = Node.new(array.shift)
        @tree.push(@root)
        array.each do |value|

            node = Node.new(value)
            @tree.push(node)
        end

        #index parent and children
        @tree.each_with_index do |node, i|
            
            unless @tree[2 * i + 1] == nil
                node.left_child = @tree[2 * i + 1]
                @tree[2 * i + 1].parent_node = node
            end

            unless @tree[2 * i + 2] == nil
                node.right_child = @tree[2 * i + 2]
                @tree[2 * i + 2].parent_node = node
            end
            
        end
    end

    def display
        puts "tree: "
        @tree.each{|node| node.display}
    end

    def breadth_first_search(value)
        @tree.each do |node|
            return node if node.value == value
        end
        return nil
    end

    def depth_first_search(value, node = @root)

        stack = [@root]

        until stack.empty?
            node = stack.pop
            return node if node.value == value
            stack.push(node.left_child) unless node.left_child.nil?
            stack.push(node.right_child) unless node.right_child.nil?
        end

    end

    def dfs_rec(value, node = @root)

            return nil if node.nil?
            unless node.left_child == nil || dfs_rec(value, node.left_child) == nil
                node = dfs_rec(value, node.left_child) 
            end
            return node if node.value == value
            unless node.right_child == nil || dfs_rec(value, node.right_child) == nil
                dfs_rec(value, node.right_child)
            end

    end

end

tree = BST.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts tree.breadth_first_search(9)
#tree.display
#puts tree.dfs_rec(9)
puts tree.depth_first_search(9)