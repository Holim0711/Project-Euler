function get_primes(n)
    sieve = [true for i in 1:n]
    sieve[1] = false
    sieve[4:2:n] .= false
    sieve[6:3:n] .= false

    for i in 6:6:((n ÷ 2) + 1)
        if sieve[i-1]
            sieve[2(i-1):i-1:n] .= false
        end
        if sieve[i+1]
            sieve[2(i+1):i+1:n] .= false
        end
    end

    return [i for (i, v) in enumerate(sieve) if v]
end

function is_prime(primes, n)
    pos = searchsorted(primes, n)
    return pos.start == pos.stop
end

function find(n)
    primes = get_primes(n)
    mid_prime_idx = searchsorted(primes, n ÷ 2).stop
    max_sum = 0
    max_cnt = 0
    for i = 1:mid_prime_idx
        Σ = primes[i]
        for j = 1:(length(primes) - i)
            Σ += primes[i + j]
            if is_prime(primes, Σ) && j > max_cnt
                max_sum = Σ
                max_cnt = j
            end
        end
    end
    return max_sum
end

println(find(1000000))