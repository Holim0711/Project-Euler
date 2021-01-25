function find(input)
    max = 0
    for x in 1:size(input, 1)
        for y in 1:size(input, 2)-3
            v = input[x,y] * input[x,y+1] * input[x,y+2] * input[x,y+3]
            if v > max
                max = v
            end
        end
    end
    for x in 1:size(input, 1)-3
        for y in 1:size(input, 2)
            v = input[x,y] * input[x+1,y] * input[x+2,y] * input[x+3,y]
            if v > max
                max = v
            end
        end
    end
    for x in 1:size(input, 1)-3
        for y in 1:size(input, 2)-3
            v = input[x,y] * input[x+1,y+1] * input[x+2,y+2] * input[x+3,y+3]
            if v > max
                max = v
            end
        end
    end
    for x in 1:size(input, 1)-3
        for y in 4:size(input, 2)
            v = input[x,y] * input[x+1,y-1] * input[x+2,y-2] * input[x+3,y-3]
            if v > max
                max = v
            end
        end
    end
    return max
end

using DelimitedFiles
println(find(readdlm(joinpath(@__DIR__, "input.txt"), ' ', Int, '\n')))
