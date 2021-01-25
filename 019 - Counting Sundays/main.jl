default_n_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days_of_week = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

function counting_sundays(year1, year2)
    day, month, year = 1, 1, 1900
    count = 0
    while year <= year2
        leap = (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0)
        n_days = (leap && month == 2) ? 29 : default_n_days[month]
        day = (day - 1 + n_days) % 7 + 1
        month += 1
        if month == 13
            month = 1
            year += 1
        end
        count += (year1 <= year <= year2) && (days_of_week[day] == "SUN")
    end
    return count
end

println(counting_sundays(1901, 2000))
