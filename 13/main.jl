x = open(joinpath(@__DIR__, "input.txt"))
y = [parse(BigInt, t) for t in eachline(x)]
println(sum(y))
