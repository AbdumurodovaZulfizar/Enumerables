# rubocop:disable Style/CaseEquality
module Enumerable
  def my_each
    return enum_for unless block_given?

    arr = *self
    i = 0
    while i < arr.length
      yield (arr[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return enum_for unless block_given?

    arr = *self
    i = 0
    while i < arr.length
      yield(arr[i], i)
      i += 1
    end
    self
  end

  def my_select
    return enum_for unless block_given?

    selected_arr = []
    my_each do |ele|
      selected_arr << ele if yield(ele)
    end
    selected_arr
  end

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

  def my_count(arg = nil)
    arr = *self
    new_arr = []
    if arg
      (arr.my_select { |ele| ele == arg }).length
    elsif block_given?
      my_each do |ele|
        new_arr << ele if yield(ele)
      end
      new_arr.length
    else
      arr.length
    end
  end

  def my_map(proc = nil)
    return enum_for unless block_given?

    arr = *self
    my_arr = []
    if proc
      arr.my_each { |ele| my_arr << proc.call(ele) }
    else
      arr.my_each { |ele| my_arr << yield(ele) }
    end
    my_arr
  end

  def my_inject(arg1 = nil, arg2 = nil)
    arr = *self
    result = 0
    if arg1.is_a?(Symbol) && !block_given?
      result = arr[0]
      i = 1
      while i < arr.length
        result = result.send(arg1, arr[i])
        i += 1
      end
    elsif arg1.is_a?(Numeric) && arg2.is_a?(Symbol) && !block_given?
      result = arg1
      arr.my_each { |ele| result = result.send(arg2, ele) }
    elsif arg1.is_a?(Numeric) && block_given?
      result = arg1
      arr.my_each { |ele| result = yield(result, ele) }
    else
      result = arr[0]
      i = 1
      while i < arr.length
        result = yield(result, arr[i])
        i += 1
      end
    end
    result
  end
end

# test my_inject
def multiply_els(arr)
  arr.my_inject(:*)
end
# rubocop:enable Style/CaseEquality
