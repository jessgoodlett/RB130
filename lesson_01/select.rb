# custom Array#select method

# [1, 2, 3].select { |num| num.odd? }
# select considers the return value of the block
# returns a new collection with the elements that evauluated as true
# this example returns [1, 3]

def select(arr)
  counter = 0
  new_arr = []
  while counter < arr.length
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end
  new_arr
end

arr = [1, 2, 3, 4, 5]
new_arr = select(arr) { |n| n.odd? }
p new_arr == arr # false because it is a new collection returned
# return [ 1, 3, 5]