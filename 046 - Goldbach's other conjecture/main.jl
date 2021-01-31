function is_prime(primes, n)
    pos = searchsorted(primes, n)
    return pos.start == pos.stop
end

function check_goldbach(n, primes)
    # assert n is odd composite
    return any(
        is_prime(primes, n - 2*i^2)
        for i = floor(Int, √(n/2)):-1:1
    )
end

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

function wow()
    primes = [2]
    for k = 3:2:typemax(Int)
        if is_divisible(k, primes)
            if !check_goldbach(k, primes)
                return k
            end
        else
            push!(primes, k)
        end
    end
end

println(wow())
