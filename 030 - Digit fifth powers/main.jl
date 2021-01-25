function digit_power_sum(n, k)
    sum = 0
    while n != 0
        q, r = divrem(n, 10)
        sum += r^k
        n = q
    end
    return sum
end

function upper_bound(k)
    n = 1
    while 10^(n-1) ≤ n * 9^k
        n += 1
    end
    return (n-1) * 9^k
end

function raise(n)
    k = 1
    while n % k == 0
        k *= 10
    end
    return (n ÷ k + 1) * k
end

function find(k)
    p = 2
    limit = upper_bound(k)
    sum = 0
    while p ≤ limit
        Σ = digit_power_sum(p, k)
        if p == Σ
            sum += p
        end
        p = (p ≥ Σ) ? (p + 1) : raise(p)
    end
    return sum
end

println(find(5))
