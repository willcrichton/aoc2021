input: "I" $ "," vs (read0 `:./day7/input.txt) [0]
range: (min input) + til (max input) - (min input)
fuel_cost: {sum abs input - x}
part1: min fuel_cost each range

sum_to: {"i" $ (x * (x + 1)) % 2}
fuel_cost_2: {sum sum_to abs input - x}
part2: min fuel_cost_2 each range