function prime_factorization(n)
    result = []
    for p in [2, 3]
        while n % p == 0
            push!(result, p)
            n ÷= p
        end
    end
    p = 6
    while p < √n
        while n % (p-1) == 0
            push!(result, (p-1))
            n ÷= (p-1)
        end
        while n % (p+1) == 0
            push!(result, (p+1))
            n ÷= (p+1)
        end
        p += 6
    end
    if n != 1
        push!(result, n)
    end
    return result
end

println(pop!(prime_factorization(600851475143)))
println(prime_factorization(10000000000011000000000001))
