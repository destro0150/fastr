function script.update(dt)
    local car = ac.getCar(0)
    if not car then return end

    -- Detectar si está dañado usando misma lógica del HUD
    local damaged = false
    if (1 - car.engineLifeLeft / 1000) > 0.2 then damaged = true end
    if car.gearboxDamage > 0.2 then damaged = true end

    for i = 0, 3 do
        if car.damage[i] / 60 > 0.2 then damaged = true end
        if car.wheels[i].suspensionDamage > 0.2 then damaged = true end
    end

    -- Reparar si hay daño
    if damaged then
        if car.repair then
            car:repair()
            ac.debug("Repair applied via car:repair()")
        else
            car:teleportToPits()
            ac.debug("Repair via teleport (workaround)")
        end
    end
end
