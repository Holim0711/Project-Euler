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

function find()
    truncatable_primes = []
    primes = [2, 3, 5, 7]
    k = 2
    while length(truncatable_primes) < 11
        if !is_divisible((6k - 1), primes)
            push!(primes, (6k - 1))
            if check_truncatable(primes, (6k - 1))
                push!(truncatable_primes, (6k - 1))
            end
        end
        if !is_divisible((6k + 1), primes)
            push!(primes, (6k + 1))
            if check_truncatable(primes, (6k + 1))
                push!(truncatable_primes, (6k + 1))
            end
        end
        k += 1
    end
    return truncatable_primes
end

function is_prime(primes, n)
    pos = searchsorted(primes, n)
    return pos.start == pos.stop
end

function check_truncatable(primes, n)
    e = 10^floor(Int, log10(n))
    l2r = n % e
    while l2r != 0
        if !is_prime(primes, l2r)
            return false
        end
        e ÷= 10
        l2r %= e
    end
    r2l = n ÷ 10
    while r2l != 0
        if !is_prime(primes, r2l)
            return false
        end
        r2l ÷= 10
    end
    return true
end

println(sum(find()))