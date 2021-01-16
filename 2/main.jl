function sum_of_GP(r, n::Int)
    return r * (1 - r^n) / (1 - r)
end

φ = (1 + √5) / 2
ψ = 1 - φ
even_fibo(k) = round(Int, (φ^3k - ψ^3k) / √5)

limit = 4000000
n = floor(Int, log(φ^3,  limit * √5))  # ignore ψ (∵ ψ^3n ≒ 0)

# check the impact of ψ
if even_fibo(n) > limit
    n -= 1
elseif even_fibo(n+1) < limit
    n += 1
end

println(round(Int, (sum_of_GP(φ^3, n) - sum_of_GP(ψ^3, n)) / √5))
