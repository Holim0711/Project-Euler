# 9-pandigital numbers should be multiples of 3
# 8-pandigital numbers also
# 6-pandigital numbers also
# 5-pandigital numbers also
# 3-pandigital numbers also
# 2-pandigital numbers are less than 2143
# Let's find the (7, 4)-pandigital prime number!

function is_pandigital(n)
    d = 1 + floor(Int, log10(n))
    n = string(n)
    return all(('0' + x) in n for x in 1:d)
end

function eratosthenes_sieve(n)
    sieve = [true for i in 1:n]
    sieve[1] = false
    sieve[2:2:n] .= false
    sieve[3:3:n] .= false

    for i in 6:6:(n ÷ 2)
        if sieve[i-1]
            start = is_pandigital(i-1) ? 2(i-1) : (i-1)
            sieve[start:i-1:n] .= false
        end
        if sieve[i+1]
            start = is_pandigital(i+1) ? 2(i+1) : (i+1)
            sieve[start:i+1:n] .= false
        end
    end

    for i in n:-1:1
        if sieve[i] && is_pandigital(i)
            return i
        end
    end
end

println(eratosthenes_sieve(7654321))
