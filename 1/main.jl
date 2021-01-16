function sum_of_AP(d, n::Int)
    return d * (n * (n + 1) ÷ 2)
end

function sum_of_multiples(m, limit=1000)
    n = (limit - 1) ÷ m
    return sum_of_AP(m, n)
end

println(sum_of_multiples(3) + sum_of_multiples(5) - sum_of_multiples(15))
