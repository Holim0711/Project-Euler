# tri   : tₙ = tₙ₋₁ + n
# penta : pₙ = pₙ₋₁ + (3n - 2)
# hexa  : hₙ = hₙ₋₁ + (4n - 3)

# t(t+1)/2 = p(3p-1)/2 = h(2h-1)

# t² + t = 3p² - p
# t² + t - (3p² -p) = 0
# 2t = -1 + √(1 + 4(3p² - p))
# (12p² - 4p + 1) should be square of odds

# 3p² - p - (t² + t) = 0
# 6p = 1 + √(12t² + 12t + 1)
# (12t² + 12t + 1) should be square of (6p - 1)

# t(t+1) = 2h(2h-1)
# t² + t - (4h² - 2h)
# 2t = -1 + √(16h² - 8h + 1)
# (16h² - 8h + 1) should be squre of odds

# p(3p-1) = 2h(2h-1)
# 3p² - p - (4h² - 2h) = 0
# 6p = 1 + √(48h² - 24h + 1)
# (48h² - 24h + 1) should be square of (6p - 1)

function find(k)
    h = 0
    while true
        h += 1
        c1 = 16 * h * h - 8 * h + 1
        r1 = floor(Int, √c1)
        if r1 * r1 != c1 || r1 % 2 != 1
            continue
        end
        c2 = 48 * h * h - 24 * h + 1
        r2 = floor(Int, √c2)
        if r2 * r2 != c2 || r2 % 6 != 5
            continue
        end
        println(h*(2h-1))
        k -= 1
        if k == 0
            break
        end
    end
end

find(3)