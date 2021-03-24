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

end




p [1,2,3,4,5,6].my_select(&:even?)