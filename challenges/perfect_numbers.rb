class PerfectNumber
  def self.classify(num)
    raise StandardError.new if num <= 0
    sum = (1...num).to_a.select { |n| num % n == 0 }.sum
    return 'perfect' if sum == num
    sum > num ? 'abundant' : 'deficient'
  end
end