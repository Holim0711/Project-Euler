word =[
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
]

word10 = [
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety",
]

function number_letter(n)
    if n == 0
        return ""
    elseif n < 20
        return word[n]
    elseif n < 100
        q, r = divrem(n, 10)
        return word10[q - 1] * number_letter(r)
    elseif n < 1000
        q, r = divrem(n, 100)
        if r == 0
            return word[q] * "hundred"
        else
            return word[q] * "hundred" * "and" * number_letter(r)
        end
    elseif n == 1000
        return "one" * "thousand"
    end
end

println(sum([length(number_letter(x)) for x in 1:1000]))
