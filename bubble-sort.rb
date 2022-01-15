numbers = [4,3,78,2,0,2]

def bubble_sort(arr)
    loop do
        swapped = false
        arr.each_with_index do | num, idx |
            if idx < arr.length - 1 && num > arr[idx + 1]
                arr[idx] = arr[idx + 1]
                arr[idx + 1] = num
                swapped = true
            end
        end
        break if !swapped
    end
    p arr
end

bubble_sort(numbers)


