function amicable_numbers(n)
    d = [0 for i in 1:n]
    for i in 1:(n÷2)
        d[2i:i:n] .+= i
    end
    sum = 0
    for i in 2:n
        if d[i] <= n && d[i] != i && d[d[i]] == i
            sum += i
        end
    end
    return sum
end

println(amicable_numbers(10000))
