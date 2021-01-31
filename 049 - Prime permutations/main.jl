function find_primes(n)
    visit = [false for i in 1:n]
    visit[1] = true
    for i = 2:(n ÷ 2)
        visit[2i:i:n] .= true
    end
    return [i for (i, x) in enumerate(visit) if !x]
end

function is_prime(primes, n)
    pos = searchsorted(primes, n)
    return pos.start == pos.stop
end

function find_prime_AS()
    primes = [x for x in find_primes(10000) if x > 1000]
    results = []
    for i in 1:length(primes)
        for j in (i+1):length(primes)
            k = 2 * primes[j] - primes[i]
            if is_prime(primes, k)
                push!(results, (primes[i], primes[j], k))
            end
        end
    end
    return results
end

function check_permutation()
    for (x, y, z) in find_prime_AS()
        if Set(string(x)) == Set(string(y)) == Set(string(z))
            println("$x$y$z")
        end
    end
end

check_permutation()