function script.update(dt)
    local car = ac.getCar(0)
    if not car then return end

    -- Loguea qué tipo de dato es
    ac.debug("car.damage: " .. tostring(car.damage))
end
