input: read0 `:./day13/input.txt
sep: input ? ""
coords: "I" $'' "," vs' sep sublist input
instrs: {"=" vs (count "fold along ") _ x} each (sep + 1) _ input

Nx: (max coords[;0]) + 1
Ny: (max coords[;1]) + 1
edgelist: coords
edgemap: {edgelist[x;1]} each group edgelist[;0] 
bitmask: {(x # 0b) , 1b , (Ny - x + 1) # 0b}
adjmtx: flip {(Ny # 0b) or/ bitmask each edgemap[x]} each til Nx

fold: {[n; l] (n sublist l) or' (reverse (n + (count l) mod 2) _ l)}
run_instr: {[adjmtx; instr]
  dim: instr[0][0]; n: "I" $ instr[1]; 
  $[dim = "x"; fold[n;] each adjmtx; fold[n; adjmtx]]}

part1: sum sum run_instr[adjmtx; instrs[0]]
part2: (" "; "#") adjmtx run_instr/ instrs