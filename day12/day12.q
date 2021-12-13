input: "-" vs' read0 `:./day12/input.txt
node_names: distinct raze input
small_nodes: all each node_names = lower node_names
N: count node_names
name_to_idx: node_names ! til N
idx_to_name: (til N) ! node_names
start: name_to_idx["start"]
end: name_to_idx["end"]

edgelist: name_to_idx input
edgemap: {edgelist[x;1]} each group edgelist[;0] 

bitmask: {(x # 0b) , 1b , (N - x + 1) # 0b}
adjmtx: {(N # 0b) or/ bitmask each edgemap[x]} each til N
adjmtx: adjmtx or flip adjmtx

search_one: {[p] 
  hop: where adjmtx[last p];
  valid_hop: hop where ((p ? hop) = (count p)) or (not small_nodes hop);
  ,[p;] each valid_hop}
search_all: {[paths] raze {[p] $[(last p) = end; enlist p; search_one p]} each paths}
part1: count (search_all/) enlist enlist start

.q.contains: {(x ? y) <> (count x)}

search_one_p2: {[p] 
  hop: where adjmtx[last p];
  small_visits: count each group p where small_nodes p;
  valid_hop: hop where (not p contains hop) or (not small_nodes hop) or ((all small_visits = 1) and (not (start; end) contains hop));
  ,[p;] each valid_hop}
search_all_p2: {[paths] raze {[p] $[(last p) = end; enlist p; search_one_p2 p]} each paths}
part2: count (search_all_p2/) enlist enlist start