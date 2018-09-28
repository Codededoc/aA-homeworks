# # DIY ADTs
#
# After you finish the exercises, or if you get stuck on one of the problems, you can view the solutions [here][adt-solutions].
#
# [adt-solutions]: https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/abstract_data_types/solution.rb
#
# ## Exercise 1 - Stack
#
# Let's write a `Stack` class. To do this, use the following framework:
#
# ```ruby
class Stack

  attr_reader :stack

  def initialize (stack = [])
    @stack = stack
  end

  def push(el)
    stack.push(el)  # adds an element to the stack
  end

  def pop
    stack.pop  # removes one element from the stack
  end

  def peek
    stack.last      # returns, but doesn't remove, the top element in the stack
    # I'm assuming it's asking for the last element of the array then,
    # if it follows LIFO
  end
end
# ```
#
# To test that your code works, create a new instance of the Stack class,
 # and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!
test_stack = Stack.new([1, 2, 3])

print test_stack
puts
print test_stack.push(4)
puts
print test_stack.pop
puts
print test_stack.peek
puts
