function gcd(x::Int, y::Int)
    if x > y
        return (x % y == 0) ? y : gcd(x % y, y)
    elseif x < y
        return (y % x == 0) ? x : gcd(y % x, x)
    else
        return x
    end
end

function lcm(x::Int, y::Int)
    return (x * y ÷ gcd(x, y))
end

ans = 1
for i in 1:20
    global ans = lcm(ans, i)
end
println(ans)
