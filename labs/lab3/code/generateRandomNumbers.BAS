repeat
    waitKey "Press any key to continue or 'q' to exit: ", key
    
    if key <> ascii("q") then print random(100)
    
until key = ascii("q") 
