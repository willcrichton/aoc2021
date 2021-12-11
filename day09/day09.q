input: "I" $'' read0 `:./day09/input.txt
N: count input
lookup: {input[x[0]][x[1]]}

neighbors: {
  pts: x +/: ((-1; 0); (1; 0); (0; -1); (0; 1)); 
  pts where all each (pts >= 0) and (pts < N)}
grid: (til N) cross (til N)
low_points: grid where {all (lookup each neighbors x) > (lookup x)} each grid 
part1: sum 1 + lookup each low_points

flat: {(x[0] * N) + (x[1])}
compute_flows: {[pt]
  ns: neighbors pt; 
  low: flat each ns where (lookup each ns) < (lookup pt); 
  $[(lookup pt) <> 9; (flat pt) ,/: low; ()]} 
edges: raze compute_flows each grid

reachable: {[sets; edge]
  contains: any each (sets ?\: edge) <> (count each sets);
  joined: enlist edge union raze sets where contains;
  remaining: sets where not contains;
  remaining , joined}
basins: () reachable/ edges
part2: prd 3 sublist desc count each basins