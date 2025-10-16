rLocate 400, 300

while true
      waitKey "h: foward, n:right, v: left, b: back", key
      
      if key = ascii("h")
         rForward 5
      elseif key = ascii("n")
         rTurn 5   
      elseif key = ascii("v")
         rTurn -5
      elseif key = ascii("b")
         rForward -5
      endif

wend
