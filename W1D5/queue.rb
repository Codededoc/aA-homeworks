# ## Exercise 2 - Queue
#
# Now let's write a `Queue` class.
# We will need the following instance methods: `enqueue(el)`, `dequeue`, and `peek`.
#
# Test your code to ensure it follows the principle of FIFO.

class Queue

  attr_reader :queue

  def initialize (queue = [])
    @queue = queue
  end

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end

end

test_queue = Queue.new([1, 2, 3])

print test_queue
puts
print test_queue.enqueue(4)
puts
print test_queue.dequeue
puts
print test_queue.peek
puts
