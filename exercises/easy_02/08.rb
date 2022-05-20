# Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.

def max_by(arr)
  return nil if arr.empty?

  max = arr[0]
  largest = yield(max)
  idx = 1
  
  until idx > arr.length-1
    value = yield(arr[idx])
    if largest < value
      largest = value
      max = arr[idx]
    end
    idx += 1
  end

  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil