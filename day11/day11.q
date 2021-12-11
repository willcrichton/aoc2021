input: "I" $'' read0 `:./day11/input.txt
N: count input;
lookup: {[grid; pt] grid[pt[0]][pt[1]]}
neighbors: {
  pts: x +/: (((-1; 0; 1) cross (-1; 0; 1)) except enlist (0; 0)); 
  pts where all each (pts >= 0) and (pts < N)}

.q.gen_grid: {[f] {[f; i] {[f; i; j] f[(i; j)]}[f; i;] each til N}[f;] each til N}; 
total: 0
flash: {[state] 
  grid: state[0]; flashed: state[1];
  flashing: (grid >= 10) and (not flashed);
  flash_at: {[flashing; pt] sum lookup[flashing;] each neighbors pt};    
  ((grid * (1 - flashing or flashed)) + (gen_grid flash_at[flashing;]); flashing or flashed)};
simulate: {[grid] 
  state: flash/[(1 + grid; gen_grid {[x] 0b})];
  `total set total + sum sum state [1];
  state [0]}

100 simulate/ input;
part1: total

steps: 0
{[grid] 
  state: flash/[(1 + grid; gen_grid {[x] 0b})];
  `steps set steps + 1;
  any any not state[1]} simulate/ input
part2: steps