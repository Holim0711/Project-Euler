result = 1//1
for a in 0:9
    for b in 0:9
        for c in 0:9
            for d in 0:9
                if 10a+b >= 10c+d
                    continue
                end
                if a == b
                    continue
                end
                if d == 0
                    continue
                end
                if (10*a*c == d*(9a+b) && (b==c)) || (10*a*c == b*(9c+d) && (a==d))
                    global result *= (10a + b) // (10c + d)
                end
            end
        end
    end
end
println(result.den)