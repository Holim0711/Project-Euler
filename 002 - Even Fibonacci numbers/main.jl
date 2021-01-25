φ = (1 + √5) / 2
ψ = 1 - φ

function sum_of_GP(r, n::Int)
    return r * (1 - r^n) / (1 - r)
end

function even_fibo(n::Int)
    return round(Int, (φ^3n - ψ^3n) / √5)   # F₃ₙ are even numbers
end

function sum_of_even_fibo(limit)
    n = floor(Int, log(φ^3,  limit * √5))   # ignore ψ (∵ ψ³ⁿ ≒ 0)

    # check the impact of ψ³ⁿ
    if even_fibo(n) > limit
        n -= 1
    elseif even_fibo(n+1) < limit
        n += 1
    end

    return round(Int, (sum_of_GP(φ^3, n) - sum_of_GP(ψ^3, n)) / √5)
end

println(sum_of_even_fibo(4000000))
