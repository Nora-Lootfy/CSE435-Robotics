# CSE435 – Robotics  
## Tutorial 3

---


### Written Questions

1. According to the "What makes a machine a robot?" diagram, what are the three key processes involved?  
2. What is the difference between a sensor and a detector?  
3. Compare and contrast **CPU-initiated (polling)** and **Sensor-initiated (interrupt)** data transfer methods.  
4. Categorize the following sensors based on their output signal type: **Tactile sensor**, **Inclinometer**, **Gyroscope**, **GPS module**.  
5. Explain the difference between **local sensors** and **global sensors**. Provide an example of each.  
6. What is the key difference between **passive sensors** and **active sensors**? Give one example of each.  
7. Describe one key advantage and one key disadvantage of a **digital sensor** compared to an **analog sensor**.  
8. Why do most **incremental encoders** have two sensors instead of one? What is this configuration called?  
9. Explain the main functional difference between an **incremental encoder** and an **absolute encoder**.  
10. What is the primary advantage of using a **Gray code disk** in an absolute encoder instead of a standard binary code disk?  
11. List three important characteristics of an **Analog-to-Digital Converter (ADC)**.   
12. In a shaft encoder with a disk having 16 white and 16 black segments, what is the **number of pulses** received from the sensor when the disk rotates for **90°** and **270°**?  
13. An A/D converter with **8-bit resolution** and **Vref = 5 V** — what is the **digital value** read for **Vin = 1 V**?  

---

### True / False

1. A sensor's primary job is to convert a physical quantity into a human-readable display.  
2. A detector typically contains both a sensor and a decision circuit.  
3. In sensor-initiated data transfer, the CPU must constantly check a status line to see if the sensor is ready.  
4. A GPS module is an example of a sensor that uses a serial link for data output.  
5. A sensor mounted on the robot to monitor its battery level is considered an external sensor.  
6. A laser scanner is an example of a passive sensor because it listens for reflections without emitting anything.  
7. Binary sensors provide a range of values, not just 0 or 1.  
8. Digital sensors always require an A/D converter to interface with a microcontroller.  
9. An incremental encoder with a single sensor can determine the direction of rotation.  
10. Absolute encoders lose their position reading when power is turned off.  
11. A/D converter accuracy is determined by its number of bits and reference voltage.  

---

### Multiple Choice Questions (MCQ)

1. Data transfer from the sensor to the CPU can be Sensor-initiated by **-------------------- technique**  
   a. Polling  
   b. Interrupt  
   c. Software  
   d. FIFO  

2. -------------------- are sufficient to locate the position of the motor shaft  
   a. Incremental encoder  
   b. Absolute encoder  
   c. Analog encoder  
   d. Both a and b  

3. -------------- sensor is an active sensor.  
   a. Battery  
   b. Sonar  
   c. On-board camera  
   d. Compass  

4. --------------- is a binary sensor.  
   a. Bumpers  
   b. Battery sensor  
   c. Inclinometer  
   d. Gyroscope  

5. The number of sensors in the gray code shaft encoders determines its ----------------  
   a. Position  
   b. Angle  
   c. Resolution  
   d. Speed  

6. -------------- sensor is an internal local sensor  
   a. Battery  
   b. Sonar  
   c. On-board camera  
   d. Compass  

7. Encoders are usually mounted directly on the  
   a. Motor shaft  
   b. Wheel shaft  
   c. Robot shaft  
   d. Both a and b  

8. CPU initiated data transfer from sensor to CPU is called a ---------------- technique  
   a. Polling  
   b. Interrupt  
   c. Register  
   d. Global  

9. Sensors mounted on the robot are called ----------- sensors  
   a. Local  
   b. Internal  
   c. Passive  
   d. Active  

10. Sensors that stimulate the environment for their measurements are called ------------------ sensors  
    a. Global  
    b. External  
    c. Active  
    d. Passive  

11. A sensor that directly returns the robot's absolute orientation ------------------  
    a. Gyroscope  
    b. Tactile  
    c. Accelerometer  
    d. Compass  

12. Inclinometer is a/an ---------------------- sensor  
    a. Internal active  
    b. Internal passive  
    c. Local active  
    d. Global passive  

13. To get the direction of rotation encoders are equipped with two sensors with  
    a. Different colors  
    b. Frequency shift  
    c. Phase shift  
    d. Different power  

14. When reading sensor data of incremental encoder, it is efficient to use ------------------  
    a. Counter register  
    b. Serial register  
    c. Digital input  
    d. Analog input  

15. ------------------ sensor is a binary sensor  
    a. Force  
    b. Battery  
    c. Tactile  
    d. Joint  

16. A/D converters use ------------------ to read data from several sensors  
    a. Analog decoder  
    b. Digital decoder  
    c. Analog MUX  
    d. Digital MUX  

17. Incremental encoder actually uses ------------------ sensors  
    a. 2  
    b. 1  
    c. 4  
    d. 3  

18. A device that receives a signal and responds to it in a distinctive manner  
    a. Actuator  
    b. Tactile  
    c. Sensor  
    d. Detector  

19. Bumpers is a type of ------------------  
    a. Feedback  
    b. Robot  
    c. Subsumption  
    d. Actuator  

20. ------------------ encoders are sufficient to locate the position of the motor shaft.  
    a. Incremental  
    b. Analog  
    c. Absolute  
    d. Both a and c  

21. ------------------ sensor that monitor the environment without disturbing it.  
    a. Local  
    b. Active  
    c. Global  
    d. Passive  

22. Encoders are usually mounted directly on the ------------------  
    a. Wheel shaft  
    b. Motor shaft  
    c. Robot shaft  
    d. Both a and b  

---

<div class="page-break"></div>

## Answer Keys

###  Written Questions  
Q1-Q11: Refer to lecture content for the main concepts.  

---

#### Q12 — Pulses from Encoder Disk

**Given:**  
- 16 white + 16 black = 32 segments per revolution  
→ 16 pulses per full 360° rotation "pulses are reflected on white segments only"  

**For 90° rotation:**  
(90° / 360°) × 16 = 4 pulses  

**For 270° rotation:**  
(270° / 360°) × 16 = 12 pulses  

**4 pulses for 90°, 12 pulses for 270°**

---

#### Q13 — ADC Digital Output

**Given:**  
- Resolution: 8 bits → 2⁸ = 256 levels  
- Vref = 5 V  
- Vin = 1 V  

**Step size (LSB):** 5 V / 256 = 0.01953 V  

**Digital output:** 1 V / 0.01953 V ≈ **51**  

**Digital value = 51 (decimal)**

---

### True / False Answers

1.  False  
2.  True  
3.  False  
4.  True  
5.  False  
6.  False  
7.  False  
8.  False  
9.  False  
10.  False  
11.  True  

---

### MCQ Answers

1. **b. Interrupt**  
2. **b. Absolute encoder**  
3. **b. Sonar**  
4. **a. Bumpers**  
5. **c. Resolution**  
6. **a. Battery**  
7. **a. Motor shaft**  
8. **a. Polling**  
9. **a. Local**  
10. **c. Active**  
11. **d. Compass**  
12. **b. Internal passive**  
13. **c. Phase shift**  
14. **a. Counter register**  
15. **c. Tactile**  
16. **c. Analog MUX**  
17. **a. 2**  
18. **d. Detector**  
19. **a. Feedback**  
20. **c. Absolute**  
21. **d. Passive**  
22. **b. Motor shaft**
