function divisible_pandigitals()
    results = []
    for d₁ in 1:9
        for d₂ in 0:9
            if d₁ == d₂
                continue
            end
            for d₃ in 0:9
                if d₃ in [d₁, d₂]
                    continue
                end
                for d₄ in [0, 2, 4, 6, 8]
                    if d₄ in [d₁, d₂, d₃]
                        continue
                    end
                    for d₅ in 0:9
                        if d₅ in [d₁, d₂, d₃, d₄]
                            continue
                        end
                        if (d₃ + d₄ + d₅) % 3 != 0
                            continue
                        end
                        for d₆ in [0, 5]
                            if d₆ in [d₁, d₂, d₃, d₄, d₅]
                                continue
                            end
                            for d₇ in 0:9
                                if d₇ in [d₁, d₂, d₃, d₄, d₅, d₆]
                                    continue
                                end
                                if (10d₅ + d₆ - 2d₇) % 7 != 0
                                    continue
                                end
                                for d₈ in 0:9
                                    if d₈ in [d₁, d₂, d₃, d₄, d₅, d₆, d₇]
                                        continue
                                    end
                                    if (d₆ + d₈ - d₇) != 0 && (d₆ + d₈ - d₇) != 11
                                        continue
                                    end
                                    for d₉ in 0:9
                                        if d₉ in [d₁, d₂, d₃, d₄, d₅, d₆, d₇, d₈]
                                            continue
                                        end
                                        if (10d₇ + d₈ + 4d₉) % 13 != 0
                                            continue
                                        end
                                        for d₀ in 0:9
                                            if d₀ in [d₁, d₂, d₃, d₄, d₅, d₆, d₇, d₈, d₉]
                                                continue
                                            end
                                            if (10d₈ + d₉ - 5d₀) % 17 != 0
                                                continue
                                            end
                                            push!(results, parse(Int, "$d₁$d₂$d₃$d₄$d₅$d₆$d₇$d₈$d₉$d₀"))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return results
end

println(sum(divisible_pandigitals()))
