is_palindrome(s) = (s == reverse(s))

function extended_euclidean(a, b)
    # find (x, y) such that ax + by = gcd(a, b)
    if a == 0
        return 0, 1
    end
    x₁, y₁ = extended_euclidean(b % a, a)
    return (y₁ - (b ÷ a) * x₁), x₁
end

function mod_inverse(x, m)
    # find 'a' such that ax ≡ 1 (mod m)
    # this method works only when x & m are coprime.
    x₁, _ = extended_euclidean(x, m)
    return (x₁ % m + m) % m
end

function largest_palindrome_product(d::Int)
    d⁺ = big(10)^d
    k⁺ = d⁺ - 10^ceil(Int, d/2) + 1
    m = 10^(floor(Int, d/2) - 1)

    xₕ = (d % 2 == 0) ? (d⁺ - 1) : (d⁺ - 21) % d⁺

    ṅ = ẋ = ẏ = 0
    for x in xₕ:-22:k⁺
        yₕ = d⁺ - mod_inverse(x, m)
        for y in yₕ:-m:max(k⁺, ceil(BigInt, ṅ / x))
            n = x * y
            if is_palindrome(string(n))
                ṅ, ẋ, ẏ = n, x, y
                break
            end
        end
    end
    return ṅ, ẋ, ẏ
end

for i = 2:16
    println("$i: ", largest_palindrome_product(i))
end
