function read_input()
    input = open(joinpath(@__DIR__, "input.txt"))
    return strip.(split(read(input, String), ","), ['"'])
end

function name_value(name)
    return sum([(Int(c) - 64) for c in name])
end

input = read_input()
sort!(input)
println(sum([(i * name_value(name)) for (i, name) in enumerate(input)]))
