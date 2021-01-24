function wow(i)
    digits = [d for d in 0:9]
    permutation = []
    count = 0
    for n in 9:-1:0
        f = factorial(n)
        for d in digits
            if d in permutation
                continue
            end
            if count + f >= i
                push!(permutation, d)
                break
            else
                count += f
            end
        end
    end
    return parse(Int, join(permutation))
end

println(wow(1000000))
