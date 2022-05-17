# custom Enumerable#reduce method

# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end
# returns one object from the collection
# the return value of the block is assigned to the accumulator object
# you can initialize the accumulator by passing in a default value as an argument
# => 6

# this only works for arrays in which each element is an integer

# def reduce(arr, acc = 0)
#   counter = 0
#   while counter < arr.length
#     acc = yield(acc, arr[counter])
#     counter += 1
#   end
#   acc
# end

# array = [1, 2, 3, 4, 5]

# reduce(array) { |acc, num| acc + num }                    # => 15
# reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


# this works for collections with integers, strings, or arrays as elements

def reduce(arr, acc = 0)
  counter = 0
  acc = arr[0]; counter = 1 if arr[0].class != Integer
  while counter < arr.length
    acc = yield(acc, arr[counter])
    counter += 1
  end
  p acc
end

reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']