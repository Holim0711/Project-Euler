using DataStructures

function num_divisors(n)
    # n = (p₁ᵏ¹) * (p₂ᵏ²) * ... * (pₘᵏᵐ)
    # d = (k₁ + 1) * (k₂ + 1) * ... * (kₘ + 1)
    d = 1
    for (p, k) in n
        d *= k + 1
    end
    return d
end

function factor_finder(n, primes)
    for p in primes
        if n % p == 0
            return p
        end
    end
    return 1
end

function highly_divisible_tri_number(T)
    numbers = [Accumulator(1=>1)]
    primes = []

    while true
        n = length(numbers) + 1
        f = factor_finder(n, primes)

        if f != 1
            push!(numbers, merge(numbers[f], numbers[n÷f]))
        else
            push!(numbers, Dict(n=>1))
            push!(primes, n)
        end

        tri_number = merge(numbers[n], numbers[n-1])
        tri_number[2] -= 1
        if num_divisors(tri_number) > T
            return n * (n-1) ÷ 2
        end
    end
end

println(highly_divisible_tri_number(500))
