function is_divisible(n, arr)
    for x in arr
        if n % x == 0
            return true
        elseif x > √n
            return false
        end
    end
    return false
end

function nth_prime(n)
    primes = [2, 3]
    k = 1
    while length(primes) < n
        if !is_divisible((6k - 1), primes)
            push!(primes, (6k - 1))
        end
        if !is_divisible((6k + 1), primes)
            push!(primes, (6k + 1))
        end
        k += 1
    end
    return primes[n]
end

println(nth_prime(10001))
