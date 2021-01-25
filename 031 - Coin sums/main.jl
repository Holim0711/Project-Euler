coins = [1, 2, 5, 10, 20, 50, 100, 200]
total = 200

count = zeros(Int, length(coins), total)

count[1, :] .= 1
count[:, 1] .= 1

for i in 2:length(coins)
    for j in 2:total
        acc = 0
        for k in 0:(j ÷ coins[i])
            remain = j - coins[i] * k
            if remain > 0
                acc += count[i-1, remain]
            else
                acc += 1
            end
        end
        count[i, j] = acc
    end
end

println(count[length(coins), total])
