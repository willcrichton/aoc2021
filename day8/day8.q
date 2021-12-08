input: {" " vs' " | " vs x} each read0 `:./day8/input.txt
counts: count each raze input[;1]
part1: sum raze counts =/: (2; 4; 3; 7) 

perm: {(1 0#x){raze(1 rotate)scan'x,'y}/x} 
ciphers: perm "abcdefg"

digits: ("abcefg"; "cf"; "acdeg"; "acdfg"; "bcdf"; "abdfg"; "abdefg"; "acf"; "abcdefg"; "abcdfg")
unscramble: {[signals; cipher] asc each cipher {("i" $ x) - 97} each signals}
matches_cipher: {[signals; cipher] all digits in unscramble[signals; cipher]}
find_cipher: {[signal] first ciphers where matches_cipher[signal;] each ciphers}
matching_ciphers: find_cipher peach input[;0]

display_to_num: {[display; cipher] 10 sv digits ? unscramble[display; cipher]}
part2: sum input[;1] display_to_num' matching_ciphers