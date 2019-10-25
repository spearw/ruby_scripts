def merge_sort(arr = [], arr2 = [], merged_array = [])

    merged_array = []
    if arr.length < 2
        return
    else
        
        left_half = arr.slice(0..((arr.size/2.0)-1).round)
        #puts "left half #{left_half}"
        right_half = arr.slice(((arr.size/2.0).round)..-1)
        #puts "right half #{right_half}"
        
        
       
        #sort left half
        left_half = merge_sort(left_half) unless left_half.length == 1
        #sort right half
        right_half = merge_sort(right_half) unless right_half.length == 1
        
        #merge sorted elements
        
        until left_half.empty? && right_half.empty?
            if left_half.empty?
                merged_array.push(right_half.shift)
            elsif right_half.empty?
                merged_array.push(left_half.shift)
            elsif left_half[0] > right_half[0]
                merged_array.push(right_half.shift)
            else
                merged_array.push(left_half.shift)
            end
        end
        
    end
    return merged_array
end
