input: flip "I" $'' read0 `:day03/input.txt
most_common: med each input
least_common: 1 - most_common
bin2int: {2 sv x}
part1: (bin2int most_common) * (bin2int least_common)

rating: {[cmp]
  initial: (count input[0]) # 1;
  search: {[cmp; mask; row] mask & cmp[row; ceiling med row where mask]}[cmp;];
  result: initial search\ input;
  end_index: (sum flip result) ? 1;
  bin2int (flip input) [result[end_index] ? 1]}
part2: rating[(=)] * rating[(<>)]