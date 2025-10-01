-- Se ejecuta en el servidor
-- Bloquear reparaciones fuera de la calle de boxes

function script.update(dt)
  for i = 0, sim.carsCount - 1 do
    local car = ac.getCar(i)
    if car and car.isConnected then
      -- chequear si el auto está en boxes
      if car.isInPitlane or car.isInPit then
        -- permitir reparar: podrías forzar reparación automática
        if car.damage > 0 then
          physics.resetCarState(car.index)
          ac.log(string.format("Reparado coche #%d (%s)", i, car.driverName))
        end
      else
        -- fuera de boxes → no hacer nada (o bloquear)
        -- se podría enviar un mensaje al chat, por ejemplo:
        -- ac.sendChatMessage(car.index, "Solo puedes reparar en pitlane!")
      end
    end
  end
end
