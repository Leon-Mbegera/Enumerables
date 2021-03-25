module Enumerable
  def my_each
    return to_enum unless block_given?
    for element in self
      yield element
    end
  end

  def my_each_with_index
    return to_enum unless block_given?
    array = to_a
    array.length.times { |i| yield array[i], i }
    return self
  end

  def my_select
    return to_enum unless block_given?

    arr = []
    my_each { |i| arr << i if yield i }
    arr
  end

  def my_all?(param = nil)
    if block_given?
      to_a.my_each { |el| return false unless yield el }
    elsif param
      to_a.my_each { |el| return false unless match?(el, param) }
    else
      to_a.my_each { |el| return false unless el }

    end
    true
  end

  def my_any?(param = nil)
    if block_given?
      to_a.my_each { |i| return true if yield i }

    elsif param
      to_a.my_each { |i| return true if match?(i, param) }

    else
      to_a.my_each { |i| return true if i }
    end
    false
  end

  def my_none?(param = nil?)
    if block_given?
      to_a.my_each { |i| return false if yield i }
    elsif param
      to_a.my_each { |i| return false if match?(i, param) }
    else
      to_a.my_each { |i| return false if i }
    end
    true
  end

  def my_count(param = nil)
    count = 0
    if block_given?
      my_each { |i| count += 1 if yield i }
    elsif param
      my_each { |i| count += 1 if match?(i, param) }
    else
      return size
    end
    count
  end

  def my_map(proc = nil)
    arr = []
    if proc
      my_each { |i| arr << proc.call[i] }
    elsif block_given?
      my_each { |i| arr << yield(i) }

    else
      return to_enum
    end
    arr
  end

  def my_inject(param1 = nil, param2 = nil)
    array = to_a
    accum = param1 || array[0]

    i = param1 ? 0 : 1
    if block_given?
      (i...array.length).my_each { |el| accum = yield(accum, array[el]) }

    elsif param1 && param2
      (i...array.length).my_each { |el| accum = accum.send(param2, array[el]) }

    elsif param1
      accum = array[0]
      (1...array.length).my_each { |el| accum =  accum.send(param1, array[el]) }
    else
      raise LocalJumpError
    end
    accum
  end

  def match?(element, param)
    case param
    when Regexp
      element =~ param
    when Class
      element.is_a?(param)
    else
      element == param
    end
  end

  def multiply_els(arr)
    arr.my_inject(:*)
  end
end

p [2,3,4,5].my_inject(:+)