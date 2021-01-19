is_palindrome(s) = (s == reverse(s))

function largest_palindrome_product(d::Int)
    d⁺ = big(10)^d - 1
    k = d ÷ 2
    k⁺ = (big(10)^k - 1) * big(10)^(d-k) + 1
    m = big(10)^(k - 1)

    xₕ = (d % 2 == 0) ? d⁺ : (d⁺ - 20)
    Yₕ = [0, d⁺, 0, d⁺-6, 0, 0, 0, d⁺-2, 0, d⁺-8]

    ṅ = ẋ = ẏ = 0
    for x in xₕ:-22:k⁺
        yₕ = Yₕ[x % 10 + 1]
        if yₕ == 0
            continue
        end
        yₘ = 0
        for y in yₕ:-10:max(k⁺, ceil(BigInt, ṅ / x))
            if (x * y + 1) % m == 0
                yₘ = y
                break
            end
        end
        for y in yₘ:-m:max(k⁺, ceil(BigInt, ṅ / x))
            n = x * y
            if is_palindrome(string(n))
                ṅ, ẋ, ẏ = n, x, y
                break
            end
        end
    end
    return ṅ, ẋ, ẏ
end

for i = 2:13
    println("$i: ", largest_palindrome_product(i))
end
