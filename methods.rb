module Enumerable

    def my_each
        for i in 0..self.length-1 do
            yield self[i]
        end
    end
    
    def my_each_with_index
        for i in 0..self.length-1 do
            yield(self[i], i)
        end
    end

    def my_select
        result = []
        self.my_each_with_index do |n, i|
            if yield n
                result << self[i]
            end
        end
        result
    end

    def my_all?
        self.my_each_with_index do |n, i|
            unless yield n
                return false
            end
        end
        true
    end

    def my_any?
        self.my_each_with_index do |n, i|
            if yield n
                return true
            end
        end
        false
    end

    def my_none?
        self.my_each_with_index do |n, i|
            if yield n
                return false
            end
        end
        true
    end

    def my_count(*args)
        count = 0

        if args.empty? && !block_given?
            self.my_each do
                count += 1
            end
        elsif block_given?
            self.my_each do |n|
                if yield(n)
                    count += 1
                end
            end
        else
            self.my_each do |n|
                if n == args[0]
                    count+= 1
                end
            end
        end
        count
    end

    def my_map(&block)
        result = []
        self.my_each do |n|
            result << block.call(n)
        end
        result
    end

    def my_inject(memo = nil)
        self.my_each do |n|
            if memo.nil?
                memo = 0
            end
            memo = yield(memo, n)
        end
        memo
    end

    def multiply_els arr
        arr.my_inject(1) do |sum, el|
            sum * el
        end
    end

end