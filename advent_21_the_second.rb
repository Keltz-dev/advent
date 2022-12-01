Finish_line = 35
p Finish_line
Max_rounds = (Finish_line * 3 / 7.0).ceil + 1

def new_grid
  Array.new(Finish_line) { Array.new(10, 0) }
end

Universe_split_amount = [1, 3, 6, 7, 6, 3, 1]
Universe_split_amount_hash = { 3.to_s => 1, 4.to_s => 3, 5.to_s => 6, 6.to_s => 7, 7.to_s => 6, 8.to_s => 3, 9.to_s => 1 }

def run_one_player(player_starting_position)
  current_grid = new_grid
  current_grid[0][player_starting_position - 1] = 1
  number_of_rolls = 0
  universes_finished_after_rolls_by_index = Array.new((Max_rounds + 1), 0)
  universes_unfinished_after_rolls_by_index = Array.new((Max_rounds + 1), 0)
  Max_rounds.times do
    after_roll_grid = new_grid
    number_of_rolls += 1
    current_grid.each_with_index do |board_wheel_universes, current_score|
      board_wheel_universes.each_with_index do |current_amount_universes, current_position|
        next if current_amount_universes == 0

        Universe_split_amount.each_with_index do |split, index|
          new_position = (current_position + index + 3) % 10
          new_score = current_score + new_position + 1
          new_amount_universes = split * current_amount_universes
          if new_score >= Finish_line
            universes_finished_after_rolls_by_index[number_of_rolls] += new_amount_universes
          else
            after_roll_grid[new_score][new_position] += new_amount_universes
            universes_unfinished_after_rolls_by_index[number_of_rolls] += new_amount_universes
          end
        end
      end
    end
    current_grid = after_roll_grid
  end
  [universes_finished_after_rolls_by_index, universes_unfinished_after_rolls_by_index]
end

def run_game(player_one_starting_position, player_two_starting_position)
  universes_player_one = run_one_player(player_one_starting_position)
  universes_player_two = run_one_player(player_two_starting_position)
  universes_won_one = 0
  universes_won_two = 0
  universes_player_one[0].each_with_index do |universes_finished, i|
    next if i < 3

    universes_won_one += universes_player_two[1][i - 1] * universes_finished
    universes_won_two += universes_player_one[1][i] * universes_player_two[0][i]
  end
  universes_won_one > universes_won_two ? universes_won_one : universes_won_two
end

player_one_starting_position = 2
player_two_starting_position = 1

time = Time.now
result = run_game(player_one_starting_position, player_two_starting_position)
p Time.now - time
p result

def play_quantum_game(pos, score = 0, depth = 0)
  if score >= Finish_line
    return [{ depth.to_s => 1 }, {}]
  else
    wins = Hash.new(0)
    notwins = Hash.new(0)
    notwins[depth.to_s] = 1
    Universe_split_amount_hash.each_pair do |mv, factor|
      npos = ((pos - 1 + mv.to_i) % 10) + 1
      nscore = score + npos
      deeper_layer = play_quantum_game(npos, nscore, depth + 1)
      deeper_layer[0].each_pair { |k, v| wins[k] += v * factor }
      deeper_layer[1].each_pair { |k, v| notwins[k] += v * factor }
    end
    [wins, notwins]
  end
end


def solve_2(a, b)
  result1 = play_quantum_game(a)
  result2 = play_quantum_game(b)
  winner1 = 0
  result1[0].each_pair { |k1, c1| winner1 += c1 * result2[1][(k1.to_i - 1).to_s] }
  winner2 = 0
  result2[0].each_pair { |k2, c2| winner2 += c2 * result1[1][k2] }
  winner1 > winner2 ? winner1 : winner2
end

time = Time.now
result = solve_2(player_one_starting_position, player_two_starting_position)
p Time.now - time
p result
