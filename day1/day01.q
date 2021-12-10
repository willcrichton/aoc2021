input: "I" $ (read0 `:day01/input.txt)

part1_a1: sum (next input) > input

part1_a2: sum 1_ (>':) input

windows: sum (neg til 3) xprev\: input
part2_a1: sum (next windows) > windows

part2_a2: sum 3_ (>':) sum 2 prev\ input