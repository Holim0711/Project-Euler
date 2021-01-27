function is_palindrome10(n)
    s = string(n)
    return (s == reverse(s))
end

function is_palindrome2(n)
    s = lstrip(bitstring(n), '0')
    return (s == reverse(s))
end

function find(n)
    results = []
    for i = 1:2:n
        if is_palindrome10(i) && is_palindrome2(i)
            push!(results, i)
        end
    end
    return results
end

println(sum(find(1000000)))