def stock_picker(stocks)
    best_stock = 0

    for i in 0..stocks.length do
        stocks_subset = stocks.slice(i, stocks.length)
        for l in 0..(stocks_subset.length-1) do
            new_stock = stocks_subset[l] - stocks_subset[0]
            if new_stock >= best_stock
                best_stock = new_stock
                puts best_stock
                buy = stocks_subset[0]
                sell = stocks_subset[l]
                puts "buy when price is " + buy.to_s 
                puts "sell when price is " + sell.to_s
                puts "buy on day " + (i + 1).to_s
                puts "sell on day " + (l + 1 + i).to_s
            else
            end
        end
    end
    best_stock
end

stock_picker([17,3,6,9,15,8,6,1,10])