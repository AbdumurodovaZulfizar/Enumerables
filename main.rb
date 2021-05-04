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
  # 4.my_all?
  def my_all?(arg = nil)
    if arg
      my_each { |ele| return false unless arg === ele }
    elsif block_given?
      my_each { |ele| return false unless yield(ele) }
    else
      my_each { |ele| return false unless ele }
    end
    true
  end
  # 5.my_any?
  def my_any?(arg = nil)
    if arg
      my_each { |ele| return true if arg === ele }
    elsif block_given?
      my_each { |ele| return true if yield(ele) }
    else
      my_each { |ele| return true if ele }
    end
    false
  end
  # 6.my_none
  def my_none?(arg = nil)
    if arg
      my_each { |ele| return false if arg === ele }
    elsif block_given?
      my_each { |ele| return false if yield(ele) }
    else
      my_each { |ele| return false if ele }
    end
    true
  end

end
