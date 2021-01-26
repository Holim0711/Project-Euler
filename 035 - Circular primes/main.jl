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

function circular_numbers(n)
    result = [string(n)]
    for i in 2:length(result[1])
        s = result[length(result)]
        push!(result, s[2:length(s)] * s[1])
    end
    return [parse(Int, x) for x in result]
end

function wow()
    count = 0
    primes = find_primes(1000000)
    for p in primes
        if all(is_prime(primes, n) for n in circular_numbers(p))
            count += 1
        end
    end
    return count
end

println(wow())