# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

# a chose to return the range because this is most similar to the Range#step method

def step(r1, r2, s)
  until r1 > r2 
    yield(r1)
    r1 += s
  end
  (r1..r2)
end

step(1, 10, 3) { |value| puts "value = #{value}" }