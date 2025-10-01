function script.update(dt)
    local car = ac.getCar(0)
    if not car then return end

    for k, v in pairs(car) do
        ac.debug(tostring(k) .. " = " .. tostring(v))
    end
end
