module Enumerable
  # 1.my_each
  def my_each
    return enum_for unless block_given?
    arr = *self
    i=0
    while i < arr.length
      yield (arr[i])
      i+=1
    end
    self
  end
  # 2.my_each_with_index
  def my_each_with_index
    return enum_for unless block_given?
    arr = *self
    i=0
    while i < arr.length
      yield(arr[i], i)
      i+=1
    end
    self
  end

  # 3.my_select
  def my_select
    return enum_for unless block_given?
    selected_arr = []
    my_each do |ele|
      selected_arr << ele if yield(ele)
    end
    selected_arr
  end

end
