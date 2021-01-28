function n_digit(i)
    return 1 + floor(Int, log10(i))
end

function champernowne_digit(n)
    for i in 1:n
        n -= n_digit(i)
        if n ≤ 0
            return reverse(string(i))[1-n] - '0'
        end
    end
end

println(prod(champernowne_digit(x) for x in [1, 10, 100, 1000, 10000, 100000, 1000000]))
