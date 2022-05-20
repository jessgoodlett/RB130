# The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:

def zip(arr1, arr2)
  result = []
  idx = 0
  until idx == arr1.size 
    result << [arr1[idx], arr2[idx]]
    idx += 1
  end
  result
end

# or without until loop
def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(e, i), result|
    result << [e, arr2[i]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]