require 'pry'
array = [5, 4, 3, 5, 1, 1, 2, 1, 2, 1, 3, 2, 3, 4, 5, 1, 2, 4, 3, 2, 5, 1, 4, 2, 1, 1, 2, 5, 4, 4, 4, 1, 5, 4, 5, 2, 1, 2, 5, 5, 4, 1, 3, 1, 4, 2, 4, 2, 5, 1, 3, 5, 3, 2, 3, 1, 1, 4, 5, 2, 4, 3, 1, 5, 5, 1, 3, 1, 3, 2, 2, 4, 1, 3, 4, 3, 3, 4, 1, 3, 4, 3, 4, 5, 2, 1, 1, 1, 4, 5, 5, 1, 1, 3, 2, 4, 1, 2, 2, 2, 4, 1, 2, 5, 5, 1, 4, 5, 2, 4, 2, 1, 5, 4, 1, 3, 4, 1, 2, 3, 1, 5, 1, 3, 4, 5, 4, 1, 4, 3, 3, 3, 5, 5, 1, 1, 5, 1, 5, 5, 1, 5, 2, 1, 5, 1, 2, 3, 5, 5, 1, 3, 3, 1, 5, 3, 4, 3, 4, 3, 2, 5, 2, 1, 2, 5, 1, 1, 1, 1, 5, 1, 1, 4, 3, 3, 5, 1, 1, 1, 4, 4, 1, 3, 3, 5, 5, 4, 3, 2, 1, 2, 2, 3, 4, 1, 5, 4, 3, 1, 1, 5, 1, 4, 2, 3, 2, 2, 3, 4, 1, 3, 4, 1, 4, 3, 4, 3, 1, 3, 3, 1, 1, 4, 1, 1, 1, 4, 5, 3, 1, 1, 2, 5, 2, 5, 1, 5, 3, 3, 1, 3, 5, 5, 1, 5, 4, 3, 1, 5, 1, 1, 5, 5, 1, 1, 2, 5, 5, 5, 1, 1, 3, 2, 2, 3, 4, 5, 5, 2, 5, 4, 2, 1, 5, 1, 4, 4, 5, 4, 4, 1, 2, 1, 1, 2, 3, 5, 5, 1, 3, 1, 4, 2, 3, 3, 1, 4, 1, 1].map(&:to_i)
# array = [3, 4, 3, 1, 2]
time1 = Time.now
array.sort!
hash = array.group_by { |v| v }
hash.each_key { |k| hash[k] = hash[k].count }
array = []
array << 0
hash.each_key { |k| array << hash[k] }
(10 - array.length).times { array << 0 }
1000000.times do
  array.each_with_index { |v, i| array[i - 1] = v }
  array[6] += array[9]
end
p array[0..8].sum
p (Time.now - time1) * 1000
