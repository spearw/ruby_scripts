def bubble_sort(array)
    (array.length-1).times do 
        0..(array.length - 1).times do |i|
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
            end
        end
    end
    array
end

puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
    (array.length-1).times do 
        0..(array.length - 1).times do |i|
            if yield(array[i], array[i+1]) > 0
                array[i], array[i+1] = array[i+1], array[i]
            end
        end
    end
    array
end

puts array = ["hi","hello","hey"]
bubble_sort_by(array) do |left, right|
left.length - right.length
end

