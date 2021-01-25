# 가능한 자릿수의 곱을 생각해보자...
# □ * □□□□ = □□□□   ······ case1
# □□ * □□□ = □□□□   ······ case2

function count_case1()
    results = []
    for x in 1:9
        for y₄ in 1:9
            if x == y₄
                continue
            end
            z₄ = (x * y₄) % 10
            if z₄ in [0, x, y₄]
                continue
            end
            for y₁ in 1:(10÷x)
                if y₁ in [x, y₄, z₄]
                    continue
                end
                for y₂ in 1:min(9, 100 ÷ x - 10y₁)
                    if y₂ in [x, y₄, z₄, y₁]
                        continue
                    end
                    for y₃ in 1:9
                        if y₃ in [x, y₄, z₄, y₁, y₂]
                            continue
                        end
                        y = y₄ + 10y₃ + 100y₂ + 1000y₁
                        z = x * y
                        if z ≥ 10000
                            continue
                        end
                        z₁ = z ÷ 1000
                        z₂ = (z ÷ 100) % 10
                        z₃ = (z ÷ 10) % 10
                        if z₂ == 0 || z₃ == 0
                            continue
                        end
                        if length(unique([x, y₁, y₂, y₃, y₄, z₁, z₂, z₃, z₄])) == 9
                            push!(results, z)
                        end
                    end
                end
            end
        end
    end
    return results
end

function count_case2()
    results = []
    for x₂ in 1:9
        for y₃ in 1:9
            if x₂ == y₃
                continue
            end
            z₄ = (x₂ * y₃) % 10
            if z₄ in [0, x₂, y₃]
                continue
            end
            for x₁ in 1:floor(Int, 1000/123 - 4/10)
                if x₁ in [x₂, y₃, z₄]
                    continue
                end
                for y₁ in 1:(100 ÷ (10x₁ + x₂))
                    if y₁ in [x₂, y₃, z₄, x₁]
                        continue
                    end
                    for y₂ in 1:9
                        if y₂ in [x₂, y₃, z₄, x₁, y₁]
                            continue
                        end
                        x = x₂ + 10x₁
                        y = y₃ + 10y₂ + 100y₁
                        z = x * y
                        if z ≥ 10000
                            continue
                        end
                        z₁ = z ÷ 1000
                        z₂ = (z ÷ 100) % 10
                        z₃ = (z ÷ 10) % 10
                        if z₂ == 0 || z₃ == 0
                            continue
                        end
                        if length(unique([x₁, x₂, y₁, y₂, y₃, z₁, z₂, z₃, z₄])) == 9
                            push!(results, z)
                        end
                    end
                end
            end
        end
    end
    return results
end

println(sum(unique(vcat(count_case1(), count_case2()))))
