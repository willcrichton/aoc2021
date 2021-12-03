input: flip "I" $'' read0 `:day3/input.txt
most_common: med each input
least_common: 1 - most_common
part1: (2 sv most_common) * (2 sv least_common)

initial: (count input [0]) # 1
oxygen_search: {x & y = ceiling med y where x}
co2_search: {x & y <> ceiling med y where x}
rating: {[search]
  result: initial search\ input;
  end_index: (sum flip result) ? 1;
  2 sv (flip input) [result[end_index] ? 1]}
part2: rating[oxygen_search] * rating[co2_search]