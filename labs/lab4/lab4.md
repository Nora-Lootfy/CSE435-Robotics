# CSE435 – Robotics
## Lab 4 – RobotBASIC Random Roaming

---

### Introduction

This lab introduces decision-making for the robot in RobotBASIC, allowing it to move around the screen while avoiding obstacles.

---

### Commands

- `ClearScr` – Clears the screen.
- `SetColor <color>`– Sets drawing color.
- `LineWidth 3` – Sets line thickness.
- `gotoxy <x>,<y>` – Sets cursor position for drawing.
- `LineTo <x>, <y>` – To draw line on the screen.

---

### Subroutines

- A subroutine in RobotBASIC starts with a **label** and ends with a **return** statement.
- A label:
  - Begins with a letter, may include letters/numbers, and ends with a colon (:).
  - Example: `DrawObjects:`
- To call a subroutine, use:
  - `Gosub <LabelName>`
- Helps organize reusable code blocks.
- Unlike functions, a subroutine in RobotBASIC:
  - Does not return a value — it simply executes a block of code and returns program control to the line after the Gosub call.
  - Can access and modify variables declared in other parts of the program (since all variables are global by default in RobotBASIC).
- This makes subroutines useful for grouping tasks, such as drawing, movement, or sensor-based decisions, without needing to pass or return values.

#### Program Structure
```basic

MainProgram:
    gosub TASK1
    gosub TASK2
End

TASK1:
    // code 
return


TASK2:
    // code
return
```

