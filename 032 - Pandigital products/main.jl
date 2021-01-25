# 가능한 자릿수의 곱을 생각해보자...
# □ * □□□□ = □□□□   ······ case1
# □□ * □□□ = □□□□   ······ case2

function check_pandigit(x, y)
    s = string(x) * string(y) * string(x * y)
    return all((c in s) for c in '1':'9')
end

function count_pandigit()
    results = []
    for x in [2,3,4,6,7,8]
        for y in 1234:(10000 ÷ x)
            if check_pandigit(x, y)
                push!(results, x * y)
            end
        end
    end
    for x in 12:98
        for y in 123:(10000 ÷ x)
            if check_pandigit(x, y)
                push!(results, x * y)
            end
        end
    end
    return unique(results)
end

println(sum(count_pandigit()))
