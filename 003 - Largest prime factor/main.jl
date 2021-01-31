function prime_factorization(n)
    result = []
    for p in [2, 3]
        while n % p == 0
            push!(result, p)
            n ÷= p
        end
    end

    for p in 6:6:ceil(Int, √n)
        while n % (p-1) == 0
            push!(result, (p-1))
            n ÷= (p-1)
        end
        while n % (p+1) == 0
            push!(result, (p+1))
            n ÷= (p+1)
        end
    end

    if n != 1
        push!(result, n)
    end

    return result
end

println(pop!(prime_factorization(600851475143)))
