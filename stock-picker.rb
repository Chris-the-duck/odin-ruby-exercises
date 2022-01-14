list = [17,3,6,9,15,8,6,1,10]


def stock_picker(arr)
    profit = 0
    buy = nil
    sell = nil
    arr.each_with_index do | num, idx |
        arr2 = arr.drop(idx)
        arr2.each_with_index do | num2, idx2 |
            if num2 - num > profit
                profit = num2 - num
                sell = idx2 + idx
                buy = idx
            end
        end
    end
    p [buy, sell], "For a profit of \$#{profit}"
end

stock_picker(list)

# I originally had just a nested each_with_index loop over the original array and a conditional
# to ensure the index for "sell" was higher than that for "buy", aka like this:

def stock_picker2(arr)
    profit = 0
    buy = nil
    sell = nil
    arr.each_with_index do | num, idx |
        arr.each_with_index do | num2, idx2 |
            if num2 - num > profit && idx2 > idx
                profit = num2 - num
                sell = idx2
                buy = idx
            end
        end
    end
    p [buy, sell], "For a profit of \$#{profit}"
end

# That works, but it seemed enormously wasteful to loop through all the permutations of the array elements
# and then exclude invalid combinations via an if rather than just dropping all irrelevant elements from
# the second loop.

