input: read0 `:day4/input.txt
nums: "I" $ "," vs input[0]
cards_input: 1_ input
n: "i" $ (count cards_input) % 6
boards: {"I" $ " " vs' cards_input[x + til 5]} each 1 + 6 * til n
boards: boards {x {x[y]}' where each y}' (boards <> 0n)

set_matches: {any (count each x inter\: y) = 5}
board_matches: {f: set_matches[;y]; any f[x] or f[flip x]}
find_matches: {boards board_matches\: x sublist nums}
rounds: find_matches each til count nums

winning_round: (sum each rounds) ? 1
winning_board: boards[rounds[winning_round] ? 1b]
board_score: {[board; round] 
  unmarked: sum (raze board) except (round sublist nums);
  unmarked * nums[round - 1]}
part1: board_score[winning_board; winning_round]

final_round: (sum each rounds) ? (count boards)
final_board: boards[rounds[final_round - 1] ? 0b]
part2: board_score[final_board; final_round]