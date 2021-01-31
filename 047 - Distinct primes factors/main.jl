using DataStructures

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

    return counter(result)
end


function find(n)
    for i = 2:typemax(Int)
        prime_factors = prime_factorization(i)
        if length(prime_factors) == n
            if all(length(prime_factorization(x)) == n for x in (i+1):(i+n-1))
                return i
            end
        end
    end
end

println(find(4))
