class Node

    attr_accessor :next_node
    attr_reader :data

    def initialize(data, next_node = nil)
        @data = data
        @next_node = next_node
    end

end

class LinkedList

    def initialize
        @head = nil

    end

    def append(data)
        #add new node to end of list
        node = Node.new(data)
        if @head.nil?
            @head = node
        else
            tail.next_node = node
        end
       
    end

    def prepend(data)
        #add new node to start of list
        node = @head
        @head = Node.new(data)
        @head.next_node = node
    end

    def size
        #return total number of nodes in list
        count = 0
        nodes { count += 1}
        count
    end

    def head
        #return first node in list
        @head
    end

    def tail
        #return last node in list
        nodes{|node| node}
    end

    def at(index)
        #returns node at index
        count = 0
            nodes {|node| return node if count ==index; count += 1}
    end

    def pop
        #removes and returns last element from list
        node = tail
        nodes{|node| node.next_node = nil if node.next_node == tail}
        node
    end

    def contains?(data)
        #returns true if passed in value is in the list
        nodes{|node| return true if node.data == data}
        false
    end

    def find(data)
        #returns index of the node containing data, or nil if not found
        index = 0
        nodes{|node| return index if node.data == data; index += 1}
        return false
    end

    def to_s
        #represent LinkList object as strings
        #format:
        #( data ) -> ( data ) -> ( data ) -> nil
        list_to_s = ""
        nodes{|node| list_to_s += "( #{node.data} ) -> "}
        list_to_s += " nil"
    end

    #extra credit

    def insert_at(data, index)
        #insert node at given index
        node = Node.new(data, at(index))
        append(node) if index > size
        index.zero? ? @head = node : at(index - 1).next_node = node
    end

    def remove_at(index)
        #removes node at given index
        #updates links
        return if index > size
        return @head = at(1) if index.zero?
        node = at(index)
        future_node = node.next_node
        previous_node = at(index-1)
        previous_node.next_node = nil
        previous_node.next_node = future_node

    end

    def nodes(node = @head)
        until node.nil?
            result = yield(node)
            node = node.next_node
        end
        result
    end
end


my_list = LinkedList.new
my_list.append('hi')
puts 'appended hi'
my_list.append('there')
puts 'appended there'
my_list.prepend('oh')
puts 'prepended oh'
my_list.append('there')
puts 'appended there'
puts my_list.size
puts "head = #{my_list.head.data}"
puts "tail = #{my_list.tail.data}"
puts "at(1) = #{my_list.at(1).data}"
puts my_list.pop.data
puts my_list.tail.data
puts my_list.contains?('oh')
puts my_list.contains?('cheese')
puts my_list.find('hi')
puts my_list.find('cheese')
puts my_list.to_s
puts my_list.insert_at('cheese', 1).data
puts my_list.to_s
puts my_list.remove_at(1).data
puts my_list.to_s
