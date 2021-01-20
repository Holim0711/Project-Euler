function sum_of_primes(n)
    visit = [false for i in 1:n]
    visit[1] = true

    sum = 0

    for i in 1:floor(Int, √n)
        if !visit[i]
            for j in 2i:i:n
                visit[j] = true
            end
            sum += i
        end
    end

    for i in ceil(Int, √n):n
        if !visit[i]
            sum += i
        end
    end

    return sum
end

println(sum_of_primes(2000000))
