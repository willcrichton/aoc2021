input: read0 `:day2/input.txt
cs: flip " " vs' input
cmd: cs[0]
amt: "I"$cs[1]

amts_for: {amt[where cmd ~\: x]}
fwd: (sum amts_for["forward"])
updown: (sum amts_for["down"]) - (sum amts_for["up"])
part1: fwd*updown

aim: sums (amt * cmd ~\: "down") - (amt * cmd ~\: "up")
fwd_depth: sum amts_for["forward"] * aim[where cmd ~\: "forward"]
part2: fwd*fwd_depth