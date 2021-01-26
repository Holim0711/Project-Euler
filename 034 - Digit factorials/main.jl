function digit_factorial(n)
    sum = 0
    while n > 0
        n, r = divrem(n, 10)
        sum += factorial(r)
    end
    return sum
end

function find()
    d = 1
    while 10^d < (d+1) * factorial(9)
        d += 1
    end
    sum = 0
    for i in 10:(10^d - 1)
        if i == digit_factorial(i)
            sum += i
        end
    end
    return sum
end

println(find())
