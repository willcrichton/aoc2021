input: {"I" $ "," vs' " -> " vs x} each read0 `:./day5/input.txt
range: {(min x) + til[1 + (max x) - (min x)]}
eqdim: (input[;0;0] = input[;1;0]) or (input[;0;1] = input[;1;1])
eq_points: {(range x[;0]) cross (range x[;1])}
points: raze eq_points each input where eqdim
danger: {sum (count each group x) >= 2}
part1: danger points

diag_range: {rising: x[0] > x[1]; $[rising; (::); reverse] range x}
diag_points: {(diag_range x[;0]) ,' (diag_range x[;1])}
diag: raze diag_points each input where not eqdim
part2: danger points , diag