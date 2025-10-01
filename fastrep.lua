local repaired = {}

function script.update(dt)
  for i = 0, sim.carsCount - 1 do
    local car = ac.getCar(i)
    if car and car.isConnected then
      if car.isInPitlane then
        if not repaired[i] then
          physics.resetCarState(car.index)
          ac.setMessage(car.index, "✅ Auto reparado en boxes")
          repaired[i] = true
        end
      else
        -- cuando sale de pits, reseteamos el flag
        repaired[i] = false
      end
    end
  end
end
