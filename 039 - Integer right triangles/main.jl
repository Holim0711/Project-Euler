# Pythagorean triplet
# a, b, c = (m² - n²), 2mn, (m² + n²)

# The following will generate all Pythagorean triples uniquely:
# k * (m² - n²), k * 2mn, k * (m² + n²)

# a + b + c = m² - n² + 2mn + m² + n² = 2m² + 2mn = p
# m(m + n) = p/2 ⋯⋯ (1)

# p/2 = m(m + n) < m(m + m) = 2m²
# √p/2 < m ⋯⋯ (2)

# n = p/2m - m > 0
# m < √(p/2) ⋯⋯ (3)

function primitive_pythagorean_triples(p)
    results = []
    for m = ceil(Int, √p/2):floor(Int, √(p/2))
        q, r = divrem(p, 2m)
        if r == 0
            n = q - m
            a, b, c = m*m - n*n, 2m*n, m*m + n*n
            if a != 0 && b != 0
                if a < b
                    push!(results, [a, b, c])
                else
                    push!(results, [b, a, c])
                end
            end
        end
    end
    return unique(results)
end

function array_unique_count(arr)
    arr = [Tuple(x) for x in arr]
    return length(unique(arr))
end

function count_all(n)
    count = [[] for i in 1:n]
    for i in 1:n
        for primitive in primitive_pythagorean_triples(i)
            for j in 1:(n ÷ i)
                #count[i*j] += 1
                push!(count[i * j], j * primitive)
            end
        end
    end
    count = [array_unique_count(x) for x in count]
    return argmax(count)
end

println(count_all(1000))
