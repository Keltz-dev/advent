require 'pry'

def max_sequence(arr)
  sum = 0
  highest = 0
  arr.each_with_index do |val, idx|
    next if sum.zero? && val.negative?

    sum += val
    sum = 0 unless sum.positive?
    highest = sum if sum > highest
  end
  highest
end


p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])
