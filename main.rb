module Enumerable
  # my_each which is equal to .each
  def my_each
    return enum_for unless block_given?

    arr = arr.to_a
    i = 0
    while i < arr.length
      yield (arr[i])
      i += 1
    end
    arr[i]
  end
end

  #   # my_each_with_index which is equal to .each_with_index
  def my_each_with_index
    return enum_for unless block_given?

    arr = arr.to_a
    arr.length.times do |i|
      yield(arr[i], i)
    end
    self
  end
end





end
