mainProgram:
    goSub drawObstacles
    goto randomRoaming   
end

randomRoaming:
   while true
       while (rBumper() & 4) = 0
           rForward 1
       wend
       
       if rFeel() & 3
           turnAngle = -90
       elseif rFeel() & 24
           turnAngle = 90
       elseif rFeel() & 4
          turnAngle = 180
       endif
      
      oldDist = 0
      for i = 1 to turnAngle
          rTurn sign(turnAngle)
          
          newDist = rRange()
          
          if newDist < oldDist
              break
          endif
          
          oldDist = newDist
      next
      
      rTurn random(30) * sign(turnAngle)
        
   wend

return

drawObstacles:
    print "Press the mouse key and hold it while you draw."
    print "Release when you have completed drawing an object."
    print "Repeat until you have drawn all the objects you want."
    print "Right click anywhere on the screen when finished"
    print "The robot will roam randomly while avoiding objects."
    waitKey "press any key to start", key
    
    clearScr
    
    rLocate 400, 300
    
    setColor black
    lineWidth 4
    
    while true
          repeat
              readMouse x, y, b
          until b = 1 or b = 2
          
          if b = 2 then break
          
          gotoXY x, y
          
          while b = 1
              readMouse x, y, b
              lineTo x, y
          wend           
    wend    

return
