# Big O-ctopus and Biggest Fish

# fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# ==================================================================
# "Sluggish Octopus" - quadratic search => O(n^2) time
def quadratic_biggest_fish(fishes)
  fishes.each_with_index do |fish1, i1|
    max_length = true

    fishes.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
    # returns at the very end of the first, main iteration,
    # as that last fish has been compared to all other fish
  end

  # a nested loop will take O(n^2) runtime
end

# ==================================================================
# "Dominant Octopus" - O(n log n) search => O(n log n) time

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=>y }

    return self if count <= 1

    midpoint = count / 2

    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.take(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end



  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged += left
    merged += right
    merged
  end

  # sorts by finding a pivot index first, then recursively looks
  # in the left and right of the pivot index
  # this is indicative of O(n log n) run time
end

# now sort fishes from longest to shortest, with merge_sort, but
# greater value first proc
# then return 1st element, as it'll be the longest
# ==================================================================
def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }

  fishes.merge_sort(&prc)[0]
end


# "Clever Octopus" - linear search => O(n) time

def linear_biggest_fish(fishes)
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish
# runs through the array only once and resets the return value you want
# ^ this is indicative of O(n) runtime
end


# ===============================================================++++++++++++++++++++==
# Dancing Octopus
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# linear octopus dance - - linear search => O(n) time
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end
# runs through the array once and returns the position of element as soon as it's found
# ^ this is indicative of O(n) runtime


# ===============================================================++++++++++++++++++++==
# constant octopus dance
# use a hash for constant lookup

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}


def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
# looks through the hash and returns the position of direction
# ^ this is indicative of O(n) runtime  
end
