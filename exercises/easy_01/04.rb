# this solution can be a bit slow for larger numbers
def divisors(n)
  (1..n).select { |i| n % i == 0 }
end

# faster solution
def divisors(n)
  arr = []
  1.upto(Math.sqrt(n)) { |i| (arr << i << n / i) if (n % i == 0) }
  arr.uniq.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute