function find_primes(n)
    visit = [false for i in 1:n]
    visit[1] = true
    for i = 2:(n ÷ 2)
        visit[2i:i:n] .= true
    end
    return [i for (i, x) in enumerate(visit) if !x]
end

function find(limit)
    primes = find_primes(limit * (2limit + 1))
    max_n , max_a, max_b = 0, 0, 0
    for b in primes
        if b > limit
            break
        end
        for a in (1-b):1000
            n = 0
            while (n^2 + a*n + b) in primes
                n += 1
            end
            if n > max_n
                max_n, max_a, max_b = n, a, b
            end
        end
    end
    return max_n, max_a, max_b
end

println(find(1000))
