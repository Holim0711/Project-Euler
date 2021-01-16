function largest_prime_factor(n::Int)
    for p in 2:round(Int, √n)
        if n % p == 0
            return largest_prime_factor(n ÷ p)
        end
    end
    return n
end

println(largest_prime_factor(600851475143))
