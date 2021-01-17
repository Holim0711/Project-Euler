function largest_palindrome_product(d::Int)
    d⁺, d⁻ = 10^d, 10^(d-1)
    for prefix = (d⁺-1):-1:d⁻
        n = prefix * d⁺ + parse(Int, reverse(string(prefix)))
        for x in (d⁺-1):-1:ceil(Int, √n)
            if n % x == 0
                return n
            end
        end
    end
    if d == 1
        return 9
    end
end

println(largest_palindrome_product(3))
