function read_input()
    input = open(joinpath(@__DIR__, "input.txt"))
    return strip.(split(read(input, String), ","), ['"'])
end

function name_value(name)
    return sum([(Int(c) - 64) for c in name])
end

function is_triangular(v)
    n = floor(Int, √(2v))
    return (n * (n+1) ÷ 2 == v)
end

input = read_input()
println(sum([is_triangular(name_value(x)) for x in input]))
