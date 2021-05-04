module Enumerable
    # my_each which is equal to .each
    def my_each
        return enum_for unless block_given?
        arr = arr.to_a
        i=0
        while i < arr.length
            yield (arr[i])
            i+=1
        end
        return arr[i]
    end







  end