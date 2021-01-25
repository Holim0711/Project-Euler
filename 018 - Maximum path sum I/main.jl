function read_input()
    input = open(joinpath(@__DIR__, "input.txt"))
    return [parse.(Int, split(t)) for t in eachline(input)]
end

function max_path(input)
    for i = 2:length(input)
        input[i][1] += input[i-1][1]
        for j = 2:length(input[i])-1
            input[i][j] += max(input[i-1][j-1], input[i-1][j])
        end
        input[i][length(input[i])] += input[i-1][length(input[i-1])]
    end
    return maximum(input[length(input)])
end

println(max_path(read_input()))
