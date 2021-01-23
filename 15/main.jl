# if (n x m) grid, then (n+m)! / (n! x m!)

function wow(n, m)
    factorial(big(n + m)) ÷ (factorial(big(n)) * factorial(big(m))) 
end


println(wow(20, 20))