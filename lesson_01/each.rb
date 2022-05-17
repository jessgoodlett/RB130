# custom Array#each method

# [1, 2, 3].each { |num| "do nothing" }
# return of the code block does not do anything
# the method invocation returns the original collection

def each(arr)
  counter = 0
  while counter < arr.length
    yield(arr[counter])
    counter += 1
  end
  arr
end

arr = [1, 2, 3]
new_arr = each(arr) { |n| puts n }
p new_arr 
p new_arr == arr # returns original object