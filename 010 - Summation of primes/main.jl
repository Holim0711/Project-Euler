function sum_of_primes(n)
    sieve = [true for i in 1:n]
    sieve[1] = false
    sieve[2:2:n] .= false
    sieve[3:3:n] .= false

    sum = 5

    for i in 6:6:floor(Int, √n)
        if sieve[i-1]
            sieve[(i-1):i-1:n] .= false
            sum += i-1
        end
        if sieve[i+1]
            sieve[(i+1):i+1:n] .= false
            sum += i+1
        end
    end

    for i in ceil(Int, √n):n
        if sieve[i]
            sum += i
        end
    end

    return sum
end

println(sum_of_primes(2000000))
