# Implementation of a list using a Native array --> ruby does this automatically

class ArrayList
  def initialize
    # the underlying storage method, has the capacity to fill 10 spots that can be filled
    @storage = [0,0,0,0,0,0,0,0,0,0] # native array: fixed size, indexing only (no . methods to storage)
    # but when full of zeros, the .size is still zero.
    @size = 0
  end

  # Adds _value_ at the end of the list
  def add(value)
    raise "bad things" if @size == @storage.length
    @storage[@size] = value
    @size += 1
  end

  # Deletes the _last_ value in the array
  def delete
    raise "bad things" if @size == 0
    # @storage[@size] = 0 #don't need this line - it only matters where we think @size is
    #when we add the next number it overrides what we had in the array at that point
    @size -= 1
  end

  def include?(key)
    @size.times do |i|
      return true if @storage[i] == key
    end
    return false #make sure this is outside the loop - common beginner mistake
  end

  def size #should return the number of elements we care about
    return @size #this is more efficient - it's contant time
    #alt - this is less efficient - big O of O(n)
    # count = 0
    # @size.times do
    #   count += 1
    # end
    # return count
  end

  def max #should return the largest element
    raise "bad things" if @size == 0
    biggest = @storage[0]  # common mistake to put in a placeholder that doesn't work - i.e. if set to 0, would have been bad.  safer to use something that you know is in the array.
    @size.times do |i|
      if @storage[i] > biggest
        biggest = @storage[i]
      end
    end
    return biggest
  end

  def to_s
    #don't do @storage.length because if there are only 2 elements in the array, would print out all the zeros
    str = ""
    @size.length.times do |i|
      str += "#{@storage[i]}, "
    end
    return "[#{str[0..-3]}]"
  end
end
