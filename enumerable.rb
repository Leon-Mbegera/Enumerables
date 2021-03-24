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
    to_a.my_each{|i| return true if match?( i, param)}

  else
    to_a.my_each{|i| return true  if i}
   end
    false
  end

end




p [1,1,2].my_any?(&:even?)
