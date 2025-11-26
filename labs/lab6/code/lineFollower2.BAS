mainProgram:
    gosub drawLine
    gosub initializeRobot
    gosub followLine   
end

followLine:
    lastTurn = -1
    
    while true
        rForward 1
        
        while rSense() & 1
            rTurn 1
            lastTurn = 1
        wend
        
        while rSense() & 4
            rTurn -1
            lastTurn = -1 
        wend
        
        while rSense() = 0
           rTurn  3 * lastTurn * -1
        wend 
    wend
return

initializeRobot:
    rLocate 180, 71, -90
    rInvisible Green
    rspeed 10
return

drawLine:
    linewidth 4
    setcolor Green
    
    gotoxy 170,71
    lineto 160,72
    lineto 145,80
    lineto 140,90
    lineto 130,100
    lineto 125,110
    lineto 120,140
    lineto 130,200
    lineto 140,250
    lineto 130,270
    lineto 145,300
    lineto 200,350
    lineto 300,325
    lineto 450,375
    lineto 450,450
    lineto 600,450
    lineto 600,400
    lineto 650,200
    lineto 500,350
return
