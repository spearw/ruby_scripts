

def grandfatherClock someProc

    currentTime = Time.now.hour
    if currentTime == 0
        currentTime = 12
    elsif currentTime > 12
        currentTime = currentTime - 12
    end
    currentTime.times do
        someProc.call
    end
end

chime = Proc.new do
    puts 'Dong!'
end

sayHello = Proc.new do
    puts 'hello'
  end

grandfatherClock chime
grandfatherClock sayHello