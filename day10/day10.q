\P 0
input: read0 `:./day10/input.txt
open_to_close: "{([<" ! "})]>"
close_to_open: "})]>" ! "{([<" 
scores: ")]}>" ! (3; 57; 1197; 25137);
check: {[state; char]
  $[state[1] <> 0; state;  
    open_to_close[char] <> " "; (state[0] , char; state[1]);
    close_to_open[char] = (last state[0]); (-1 _ state[0]; state[1]);
    (state[0]; scores[char] + state[1])]}
checked: {((); 0) check/ x} each input    
part1: sum checked[;1]

incomplete: checked where checked[;1] = 0
p2_points: ")]}>" ! (1; 2; 3; 4)
p2_score: {[line]
  pts: p2_points[open_to_close[reverse line]];
  0 {y + x * 5}/ pts}
part2: med p2_score each incomplete[;0]