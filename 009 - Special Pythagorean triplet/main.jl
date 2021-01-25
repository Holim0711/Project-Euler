# Pythagorean triplet
# a, b, c = (m² - n²), 2mn, (m² + n²)
# a + b + c = m² - n² + 2mn + m² + n² = 2m² + 2mn = k
# m(m + n) = k/2 ⋯⋯ (1)

# k/2 = m(m + n) < m(m + m) = 2m²
# √k/2 < m ⋯⋯ (2)

# n = (k/2 - m²) / m > 0
# m < √(k/2) ⋯⋯ (3)

function find_pythagorean_triplet(k)
    for m = ceil(Int, √k/2):floor(Int, √(k/2))
        q, r = divrem(k, 2m)
        if r == 0
            n = q - m
            return m*m - n*n, 2m*n, m*m + n*n
        end
    end
end

a, b, c = find_pythagorean_triplet(1000)
println(a*b*c)
