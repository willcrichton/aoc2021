input: "I" $'' read0 `:./day9/input.txt
N: count input
lookup: {input[x[0]][x[1]]}

neighbors: {
  pts: x +/: ((-1; 0); (1; 0); (0; -1); (0; 1)); 
  pts where all each (pts >= 0) and (pts < N)}
I: (til N) cross (til N)
low_points: I where {all (lookup each neighbors x) > (lookup x)} each I 
part1: sum 1 + lookup each low_points

flat: {(x[0] * N) + (x[1])}
single_flow: {
  ns: neighbors x; 
  low: flat each ns where (lookup each ns) < (lookup x); 
  $[(lookup x) <> 9; ((flat x) ,/: low); ()]} 
edges: raze single_flow each I

reachable: {[sets; edge]
  contains: any each (sets ?\: edge) <> (count each sets);
  joined: edge union raze sets where contains;
  remaining: sets where not contains;
  remaining , (enlist joined)}
basins: () reachable/ edges
part2: prd 3 sublist desc count each basins