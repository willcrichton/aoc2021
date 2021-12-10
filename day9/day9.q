input: "I" $'' read0 `:./day9/input.txt
N: count input
lookup: {input[x[0]][x[1]]}

neighbors: {
  pts: x +/: ((-1; 0); (1; 0); (0; -1); (0; 1)); 
  pts where all each (pts >= 0) and (pts < N)}
I: (til N) cross (til N)
low_points: I where {all (lookup each neighbors x) > (lookup x)} each I 
part1: sum 1 + lookup each low_points

single_flow: {
  ns: neighbors x; 
  low: ns where (lookup each ns) < (lookup x); 
  $[(count low) = 1; enlist (x; first low); ()]} 
flows: raze single_flow each I
flat: {(x[0] * N) + (x[1])}
edges: (flat'') flows
bitmask: {(x # 0f) , 1f , (y - x + 1) # 0f}
N2: N * N
edges_to_mtx: {[edges]
  edge_map: edges[;0] ! edges[;1];
  {[edge_map; n] bitmask[n; N2] | $[edge_map[n] <> 0n; bitmask[edge_map[n]; N2]; N2 # 0]}[edge_map;] each til N2}
graph: (edges_to_mtx edges) or (edges_to_mtx (reverse each edges))
/ INCOMPLETE: need to figure out graph reachability in Q