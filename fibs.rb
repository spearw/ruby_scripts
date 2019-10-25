def fibs(n)
    if n == 0
        return 0
    elsif n == 1
        return 1
    else
        fibs(n-1) + fibs(n-2)
    end
end

puts fibs(8)