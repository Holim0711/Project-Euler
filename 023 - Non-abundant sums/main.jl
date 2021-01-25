function abundant_numbers()
    n = 28123
    d = [0 for i in 1:n]
    for i in 1:(n÷2)
        d[2i:i:n] .+= i
    end
    return [x for x in 1:n if d[x] > x]
end

function non_abundant_sums()
    numbers = abundant_numbers()
    d = [false for i in 1:28123]
    for x in numbers
        for y in numbers
            if x + y <= length(d)
                d[x+y] = true
            end
        end
    end
    sum = 0
    for (i, j) in enumerate(d)
        if !j
            sum += i
        end
    end
    return sum
end

println(non_abundant_sums())
