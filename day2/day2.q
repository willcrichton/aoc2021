input: read0 `:day2/input.txt
cs: flip " " vs' input
cmd: cs[0]
amt: "I" $ cs[1]
.q.with_cmd:{x[where cmd ~\: y]}

horz: sum amt with_cmd "forward"
depth: (sum amt with_cmd "down") - (sum amt with_cmd "up")
part1: horz * depth

aim: sums amt * (cmd ~\: "down") - (cmd ~\: "up")
aim_depth: sum (amt with_cmd "forward") * (aim with_cmd "forward")
part2: horz * aim_depth