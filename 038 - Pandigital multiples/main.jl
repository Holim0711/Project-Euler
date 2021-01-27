# 9 and (1,2,3,4,5) ⇒ 918273645
# So, the first digit should be 9...

function digit_concat(digit)
    x = 0
    for d in digit
        x = x * 10 + d
    end
    return x
end

function check(n)
    digits = []
    i = 1
    while length(digits) < 9
        new_digits = [(c - '0') for c in string(n * i)]
        if 0 in new_digits || length(new_digits) != length(unique(new_digits))
            return 0
        end
        digits = vcat(digits, new_digits)
        if length(digits) != length(unique(digits))
            return 0
        end
        i += 1
    end
    return digit_concat(digits)
end

function find()
    max_n = 0
    for i = [91:2:97;911:2:987;9111:2:9875]
        n = check(i)
        if n > max_n
            max_n = n
        end
    end
    return max_n
end

println(find())