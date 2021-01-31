function self_power(n)
    sum = 0
    for i = 1:big(n)
        sum += i^i
    end
    return sum
end

x = string(self_power(1000))
println(x[length(x) - 9:length(x)])