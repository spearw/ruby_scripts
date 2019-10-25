$nestingDepth = 0
$space = " "


def log blockDescription, &someProc
    puts $space*$nestingDepth + 'Beginning "'+blockDescription+'"...'
    $nestingDepth = $nestingDepth + 1
    valueReturned = someProc.call
    $nestingDepth = $nestingDepth - 1
    puts $space*$nestingDepth + +blockDescription + ' finished, returning: '
    puts valueReturned
end



log 'first block' do
    log 'some other block' do
        5
    end

    log 'another block' do
        'tomato town'
    end

    false
end