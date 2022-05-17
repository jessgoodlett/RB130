# custom times method

# 5.times { |num| puts num }
# outputs:
# 0
# 1
# 2
# 3
# 4
# returns:
# 5

def times(num)
  counter = 0
  while counter < num
    yield(counter)
    counter += 1
  end
  num
end

times(10) { |n| puts n}
