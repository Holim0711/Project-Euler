is_palindrome(s) = (s == reverse(s))

function largest_palindrome_product(d::Int)
    max = 0
    for x = round(Int, 10^d - 1):-1:round(Int, 10^(d-1))
        for y = round(Int, 10^d - 1):-1:round(Int, 10^(d-1))
            n = x * y
            if is_palindrome(string(n)) && n > max
                max = n
            end
        end
    end
    return max
end

println(largest_palindrome_product(3))
