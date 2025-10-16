mainProgram:
      gosub drawObstacles
      rLocate 600, 50
      gosub RemoteControl
end


drawObstacles:

    rectangle 300, 300, 500, 500, red, red
    circle 100, 100, 200, 200, blue, blue
    circle 600, 500, 700, 550, magenta, magenta

return


RemoteControl:
    p = up

    repeat
          readMouse x, y, b
          
          if b = 1  //left button clicked
             gosub goToPoint
          endif
          
          if b = 2  //right button clicked
             p = not p
             rPen p
             
             delay 200
          endif
          
    until false
return

goToPoint:
    dx = x - rGpsX()
    dy = y - rGpsy()
    
    if dx = 0 and dy = 0 then return
    
    theta = polarA(dx, dy) * 180 / pi() + 90 - rCompass()
    
    if theta > 180 then theta = theta - 360
    if theta < -180 then theta = theta + 360
    
    rTurn theta
    
    distance = round(polarR(dx, dy))
    
    for i = 1 to distance
        if rBumper() & 4 then break
        
        rForward 1
    next

return

