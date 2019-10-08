function permgen(a, n)
    n = n or #a
    if n <= 1 then
        coroutine.yield(a)
    else
        for i=1,n do
            a[n], a[i] = a[i], a[n]
            permgen(a, n-1)
            a[n], a[i] = a[i], a[n]
        end
    end
end

function permutation(a)
    local co = coroutine.create(function () permgen(a) end)
    return function ()
        local code, value = coroutine.resume(co)
        return value
    end
end

function printR(a)
    for i=1,#a do
        io.write(a[i], ' ')
    end
    io.write('\n')
end

for p in permutation{1,2,3,4,5} do
    printR(p)
end
