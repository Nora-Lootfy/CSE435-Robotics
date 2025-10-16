rLocate 400, 300


prevKey = 0
lastValidKey = 0
status = 0


while true
      getKey key
      
      if key <> 0 and key <> prevKey
         if key = ascii("h") or key = ascii("n") or key = ascii("v") or key = ascii("b")
            lastValidKey = key
            status = 1 - status
         endif
      endif

      prevKey = key
      
      if status 
         if lastValidKey = ascii("h") 
            rForward 5
         elseif lastValidKey = ascii("n")
            rTurn 5   
         elseif lastValidKey = ascii("v")
            rTurn -5
         elseif lastValidKey = ascii("b")
            rForward -5
         endif
      endif
      
      
      delay 10

wend

