# CSE435 – Robotics
## Lab 6 – RobotBASIC Following a Line

---

### Objective

This lab explains how to make a RobotBASIC robot follow a line on the floor using its built-in line sensors.

### Setting Line Colors – rInvisible

To tell the robot which floor colors represent the line:

```basic
rInvisible Color1, Color2, ...
```

- These colors are treated as line markings or beacons.
- The robot ignores them as obstacles and instead follows them.

### Line Sensors - rSense()

The robot has three line sensors:

- One in the center front `rSense() → 2`
- Two others left `rSense() → 4` and right `rSense() → 1` of the front sensor.

They detect whether the robot is exactly on top of the line, slightly off-center, or drifting.

```basic
    rSense()
```

### Algorithm 1

**Uses a basic line-following strategy:**  
- Move forward.
- Turn left or right when the line is detected by left or right sensors.

**Problem:**  
- Works well for straight or gentle curves.
- Fails on sharp turns because:
  - The robot overshoots the turn.
  - Loses the line since the simple logic cannot recover from big direction changes.

### Algorithm 2

**Uses a more intelligent control strategy:**  
- Move forward.
- Turn left or right when the line is detected by left or right sensors while keeping the value of last turn.
- If the line was lost, turn the opposite direction of last turn