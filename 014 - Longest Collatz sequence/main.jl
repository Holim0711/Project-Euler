function collatz_tree!(k, d, visit)
    if visit[k] != 0
        return
    end
    visit[k] = d
    if 2k <= length(visit)
        collatz_tree!(2k, d + 1, visit)
    end
    q, r = divrem(k - 1, 3)
    if r == 0 && q > 1 && (q % 2) == 1
        collatz_tree!(q, d + 1, visit)
    end
end

function collatz_sequence(n, visit)
    if n <= length(visit) && visit[n] != 0
        return visit[n]
    end
    if n % 2 == 0
        return collatz_sequence(n ÷ 2, visit) + 1
    else
        return collatz_sequence(3n + 1, visit) + 1
    end
end

function longest_collatz_sequence(n)
    visit = [0 for i in 1:n]
    collatz_tree!(1, 1, visit)
    max_len, max_num = 0, 0
    for i in 1:n
        if visit[i] == 0
            len = collatz_sequence(i, visit)
            visit[i] = len
            if len > max_len
                max_len = len
                max_num = i
            end
        end
    end
    return max_num
end

println(longest_collatz_sequence(1000000))
