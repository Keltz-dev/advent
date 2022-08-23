require 'pry'

# p1_score = 0
# p2_score = 0
# die = 6

# def roll(position, die)
#   position = (position + die) % 10
#   position = 10 if position.zero?
#   position
# end

# while p1_score < 1000 && p2_score < 1000
#   p1_position = roll(p1_position, die)
#   p1_score += p1_position
#   die += 9
#   p2_position = roll(p2_position, die)
#   p2_score += p2_position
#   die += 9
#   p p1_score
#   p p2_score
# end

# times_rolled = (die - 6) / 3
# loser = p1_score < 1000 ? p1_score : p2_score
# times_rolled * loser
p1_position = 4
p2_position = 8

def all_games_of(position)
  results = Hash.new(0)
  current_state = []
  number_of_rounds = 0
  wheelsize = 10
  target = 3

  wheelsize.times { current_state << Hash.new(0) }
  current_state[position - 1][0] = 1
  p current_state
  10.times do
    number_of_rounds += 1
    next_go = []
    wheel = (1..wheelsize).to_a
    wheelsize.times { next_go << Hash.new(0) }

    current_state.each_with_index do |score_hashes, position_on_wheel|
      score_hashes.each_pair do |score, amount_of_games|
        new_score = score + wheel[position_on_wheel - 1]
        if new_score < target
          next_go[position_on_wheel - 1][new_score] += amount_of_games
        else
          results[number_of_rounds] += amount_of_games
        end
        new_score = score + wheel[position_on_wheel - 2]
        if new_score < target
          next_go[position_on_wheel - 2][new_score] += amount_of_games * 3
        else
          results[number_of_rounds] += amount_of_games * 3
        end
        new_score = score + wheel[position_on_wheel - 3]
        if new_score < target
          next_go[position_on_wheel - 3][new_score] += amount_of_games * 6
        else
          results[number_of_rounds] += amount_of_games * 6
        end
        new_score = score + wheel[position_on_wheel - 4]
        if new_score < target
          next_go[position_on_wheel - 4][new_score] += amount_of_games * 7
        else
          results[number_of_rounds] += amount_of_games * 7
        end
        new_score = score + wheel[position_on_wheel - 5]
        if new_score < target
          next_go[position_on_wheel - 5][new_score] += amount_of_games * 6
        else
          results[number_of_rounds] += amount_of_games * 6
        end
        new_score = score + wheel[position_on_wheel - 6]
        if new_score < target
          next_go[position_on_wheel - 6][new_score] += amount_of_games * 3
        else
          results[number_of_rounds] += amount_of_games * 3
        end
        new_score = score + wheel[position_on_wheel - 7]
        if new_score < target
          next_go[position_on_wheel - 7][new_score] += amount_of_games
        else
          results[number_of_rounds] += amount_of_games
        end
      end
    end

    current_state = next_go
  end
  results
end

p1_results = all_games_of(p1_position)
p2_results = all_games_of(p2_position)
p2_array = []

p2_results.each_key do |round|
  p2_array << p2_results[round]
end

wins = Hash.new(0)

p1_results.each_pair do |round, value|
  wins[1] += value * p2_array[(round - 2)..-1].sum
  higher = (round - 4).positive? ? round - 4 : 0
  wins[2] += value * p2_array[0..higher].sum
end

p p1_results
p p2_results
p wins[1] / 27
p wins[2] / 27
