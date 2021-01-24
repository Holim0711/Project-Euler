φ = (1 + √5) / 2

function n_digit_fibo(n)
    return ceil(Int, (n - 0.5 - log10(2)/2) / log10(φ))
end

println(n_digit_fibo(1000))
