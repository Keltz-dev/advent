def spin_words(string_to_reverse)
  arr = []
  str = "def spin_words_for_real_this_time(str); str = str.split(' ').map! { |word| word.length > 4 ? word.reverse! : word }.join(' '); end"
  # str = "def spin_words_for_real_this_time(str); arr = str.split(' '); arr.map! do |part|; part = part.scan(/\\w+|\\W/).map! do |match|; match[/\\w+/] == match && match.length > 4 ? match.reverse! : match; end; part.size == 1 ? part : part.join; end; arr.join(' '); end"
  str.chars.each { |c| arr += c.unpack("B*") }
  arr = arr.join.chars
  recompiler = []
  recompiler << arr.first
  count_zero = 0
  count_one = 0
  count_zero_before_current_loop = 0
  count_one_before_current_loop = 0
  arr.each do |bin|
    bin.to_i.zero? ? count_zero += 1 : count_one += 1
    if count_zero_before_current_loop == count_zero && count_zero.positive?
      recompiler << count_zero
      count_zero = 0
    end
    if count_one_before_current_loop == count_one && count_one.positive?
      recompiler << count_one
      count_one = 0
    end
    count_zero_before_current_loop = count_zero
    count_one_before_current_loop = count_one
  end
  recompiler << count_zero unless count_zero.zero?
  recompiler << count_one unless count_one.zero?
  string_of_zeros_and_ones = ""
  use_zero = recompiler.delete_at(0).to_i.zero?
  recompiler.each do |count|
    count.times do
      string_of_zeros_and_ones += use_zero ? "0" : "1"
    end
    use_zero = !use_zero
  end
  string = [*string_of_zeros_and_ones].pack("B*")
  eval(string)
  method(:spin_words_for_real_this_time)
  # spin_words_for_real_this_time(string_to_reverse)
end

p spin_words("Hey fellow Le Wagon alumni") # => "Hey wollef Le nogaW inmula"
p spin_words("Rake it until you make it") # => "Rake it litnu you make it"
p spin_words("Change your life, learn to code") # => "egnahC your life, nrael to code"
