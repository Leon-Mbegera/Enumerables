module Enumerable

  def my_each
    return to_enum unless block_given?

    for element in self
      yield element
    end
  end 
  
end


puts [3, 5, 8, 1].my_each 