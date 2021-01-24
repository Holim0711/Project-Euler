function reciprocal_cycle_length(d)
    while d % 2 == 0
        d ÷= 2
    end
    while d % 5 == 0
        d ÷= 5
    end
    n = 1
    while (big(10)^n - 1) % d != 0
        n += 1
    end
    return n
end

println(argmax([reciprocal_cycle_length(x) for x in 1:1000]))
