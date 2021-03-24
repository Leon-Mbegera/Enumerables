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
    array.length.times {|element| yield array[element], element}
    array
  end
  
  def my_select 
    return to_enum unless block_given?
     arr = []
     my_each{|i|arr << i if yield i }
    arr
  end

  def my_all?(param = nil)
    if block_given?
      to_a.my_each{|i| return false unless yield i }
    elsif param
      to_a.my_each{|i| return false unless match?(i, param)}
    else
      to_a.my_each{|i| return false unless i}

    end
    return true
  end

  def my_any? (param = nil)
    if block_given?
      to_a.my_each{|i| return true if yield i}
 
  elsif param
    to_a.my_each{|i| return true if match?(i, param)}

  else
    to_a.my_each{|i| return true  if i}
   end
    false
  end

  def my_none? (param = nil?)
    if block_given?
      to_a.my_each{|i| return false if yield i}
    elsif param 
      to_a.my_each {|i| return false if match?(i, param)}
    else
      to_a.my_each {|i| return false if i}
    end
    true
  end

  def my_count(param = nil)
    count =  0
    if block_given?
      my_each{|i| count += 1 if yield i}
    elsif param
      my_each{|i| count += 1 if match?(i, param)}
    else
    return length
    end
    count
  end


  def my_map (proc = nil)
    arr = []
    if proc
      my_each{|i| arr<< proc.call[i]}
    elsif block_given?
      my_each{|i| arr << yield(i)}

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
      (i...array.length).my_each{|i| accum =  yield(accum, array[i])}
    elsif param1 && param2
      (i...array.length).my_each{|i| accum.send(param2, array[i])}
    elsif param1
      accum =  array[0]
      (1...array.length).my_each{|i| accum.send(param1, array[i])}
    else
      raise LocalJump
    end
    accum
  end

  def match?(i, param)
    case param
    when Regexp
      i =~ param
    when Class
      i.is_a?(param)
    else
      i == param
    end
  end

  def multiply_els(arr)
    arr.my_inject(:*)
  end

end





