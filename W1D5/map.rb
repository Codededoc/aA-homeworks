# ## Exercise 3 - Map
#
# As you saw in the videos for tonight, a map can be implemented using a 2D array.
# Let's write a Map class (following a similar pattern to `Stack` and `Queue`) that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always unique.
# When implemented with arrays, a map might look something like this: `my_map = [[k1, v1], [k2, v2], [k3, v2], ...]`.
#
# Our Map class should have the following instance methods: `set(key, value)`, `get(key)`, `delete(key)`, `show`.
# Note that the `set` method can be used to either create a new key-value pair or update the value for a pre-existing key.
# It's up to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map

  def initialize
    @init_arr = []
  end

  def set(key, value)
    pair_index = init_arr.index { |pair| pair[0] == key }

    if pair_index
        init_arr.index { |pair| pair[1] == value }
      else
        init_arr.push([key, value])
    end

    init_arr
  end

  def get(key)
    init_arr.each { |arr| return arr if arr.first == key }
  end

  def delete(key)
    init_arr.reject! { |arr| arr.first == key }
  end

  def show
    deep_dup(init_arr)
  end

  private

  attr_reader :init_arr

  def deep_dup(init_arr)
      arr.map do |el|
        if el.is_a?(Array)
          deep_dup(el)
        else
          el
        end
      end
  end

end

puts "set tests"
puts "==============================="
test_map = Map.new
p test_map
puts
puts "set tests"
print test_map.set(2, "two")
puts
