# def appeal_num(num, idx, arr_length)
#   middle = arr_length.even? ? (arr_length / 2) + 0.5 : arr_length / 2
#   num + (middle - (idx + 1)).abs
# end

def max_appeal(arr)
  arr_length = arr.length
  idxone = 0
  idxtwo = 1
  # numone = appeal_num(arr.first, 0, arr_length)
  # numtwo = appeal_num(arr[1], 1, arr_length)
  numone = arr[idxone]
  numtwo = arr[idxtwo]
  arr.each_with_index do |num, idx|
    next if idx == idxone || idx == idxtwo
    # compare = appeal_num(num, idx, arr_length)
    # p "compare: #{compare}"

    if numtwo > numone && (num - numone) >= (idx - idxone)
      idxone = idx
      numone = num
      p "reassigned numone"
      p numone
    elsif numone > numtwo && (num - numtwo) >= (idx - idxtwo)
      idxtwo = idx
      numtwo = num
      p "reassigned numtwo"
      p numtwo
    end

    # if (num - highest_num) >= (idx - highest_idx)
    #   numtwo = first
    #   numone = num
    # end
    # p "idxone: #{idxone}"
    # p "idxtwo: #{idxtwo}"
    # p "numone: #{numone}"
    # p "numtwo: #{numtwo}"
  end
  [idxone, idxtwo]
end

# arr = [1000, 2]
arr = [8, 10, 8, 4, 2, 3, 1, 3, 4, 7, 4]
#arr = [9, 2, 2, 2, 2, 2, 2, 17, 17]
# arr = [10, 8, -4, 2, 3, 1, -3, 4, -5, -4]
p max_appeal(arr)

# if (num - highest_num) > (idx - highest_idx)

    # if numtwo > numone && ((idxone - idxtwo) + numone) >= ((idx - idxtwo) + num)
    #   idxone = idx
    #   numone = num
    #   p "reassigned numone"
    #   p numone
    # elsif numone > numtwo && ((idxtwo - idxone) + numtwo) >= ((idx - idxone) + num)
    #   idxtwo = idx
    #   numtwo = num
    #   p "reassigned numtwo"
    #   p numtwo
    # end
