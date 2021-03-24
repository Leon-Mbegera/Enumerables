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
  










end




[3,5,8,1].my_each_with_index{|element, i| p "#{element} #{i}"}
 