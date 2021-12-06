input: "I" $ "," vs (read0 `:./day6/input.txt) [0]
simulate_one: {$[x = 0; (6; 8); x - 1]}
simulate_all: {raze simulate_one each x}
part1: count 80 simulate_all/ input

days: til 9
seed_counts: count each group input
seed: {$[seed_counts[x] <> 0n; seed_counts[x]; 0]} each days
simulate_bin: {[d; i] $[i=8; d[0]; i=6; d[7] + d[0]; d[i+1]]}
simulate_all: {days ! (simulate_bin[x;] each days)}
part2: sum 256 simulate_all/ seed