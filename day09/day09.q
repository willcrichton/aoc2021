input: "I" $'' read0 `:./day09/input.txt
N: count input
lookup: {input[x[0]][x[1]]}

neighbors: {
  pts: x +/: ((-1; 0); (1; 0); (0; -1); (0; 1)); 
  pts where all each (pts >= 0) and (pts < N)}
I: (til N) cross (til N)
low_points: I where {all (lookup each neighbors x) > (lookup x)} each I 
part1: sum 1 + lookup each low_points

flat: {(x[0] * N) + (x[1])}
compute_flows: {
  ns: neighbors x; 
  low: flat each ns where (lookup each ns) < (lookup x); 
  $[(lookup x) <> 9; (flat x) ,/: low; ()]} 
edges: raze compute_flows each I

reachable: {[sets; edge]
  contains: any each (sets ?\: edge) <> (count each sets);
  joined: enlist edge union raze sets where contains;
  remaining: sets where not contains;
  remaining , joined}
basins: () reachable/ edges
part2: prd 3 sublist desc count each basins