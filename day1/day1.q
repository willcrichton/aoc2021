input: "I" $ (read0 `:day1/input.txt)
part1: sum (next input) > input
windows: sum (neg til 3) xprev\: input
part2: sum (next windows) > windows