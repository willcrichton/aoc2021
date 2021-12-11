\P 0
/ needed or else final answer gets truncated

input: read0 `:./day10/input.txt
open_to_close: "{([<" ! "})]>"
close_to_open: "})]>" ! "{([<" 
p1_points: ")]}>" ! (3; 57; 1197; 25137);
pop: {-1 _ x}
check: {[state; char] 
  stack: state[0]; score: state[1];
  $[score <> 0;                         
      state;  
    open_to_close[char] <> " ";         
      (stack, char; 0);
    close_to_open[char] = (last stack); 
      (pop stack; 0);
    / else
      (stack; p1_points[char])]}
checked: check/[((); 0);] each input    
part1: sum checked[;1]

incomplete: checked where checked[;1] = 0
p2_points: ")]}>" ! (1; 2; 3; 4)
p2_score: {[line]
  pts: p2_points[open_to_close[reverse line]];
  0 {y + x * 5}/ pts}
part2: med p2_score each incomplete[;0]