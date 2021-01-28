# Let D = pⱼ - pₖ = pᵢ
# pⱼ - pⱼ₋₁ ≤ pᵢ ⇒ 3j - 2 ≤ pᵢ

# pⱼ + pₖ = pᵢ + 2pₖ
# pⱼ > pₖ
# pⱼ > pᵢ

function is_pentagonal(n)
    k = (1 + √(1 + 24n)) ÷ 6
    return n == (k * (3k - 1) ÷ 2)
end

function penta_penta()
    for i in 1:9999999999
        pᵢ = i * (3i - 1) ÷ 2
        for j in (i+1):((pᵢ + 2) ÷ 3)
            pⱼ = j * (3j - 1) ÷ 2
            pₖ = pⱼ - pᵢ
            if !is_pentagonal(pₖ)
                continue
            end
            if is_pentagonal(pⱼ + pₖ)
                return pᵢ, pⱼ, pₖ
            end
        end 
    end
end

println(penta_penta())