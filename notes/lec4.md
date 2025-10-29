# CSE435 – Robotics

## Lecture 4 Notes

**Topic:** Sensors for Mobile Robots

---

### 1. Sonar (Ultrasonic) Sensor

#### **Principle**

* Emits short acoustic signals (~1 ms) at ultrasonic frequencies between **50 kHz – 250 kHz**.
* Measures the time from signal emission until the echo returns to the sensor — known as **Time of Flight (ToF)**.

    <p>
    <math xmlns="http://www.w3.org/1998/Math/MathML" role="math">
        <mrow>
        <mi>Time of Flight</mi>
        <mo>=</mo>
        <mn>2</mn>
        <mo>&#x00D7;</mo> <!-- multiplication sign -->
        <mi>Distance to nearest obstacle</mi>
        </mrow>
    </math>
    </p>

* If no echo is received within a specified time window, it indicates **no nearby obstacle**.

#### **Disadvantages**

1. **Narrow Detection Cone:**

   * Each sensor covers only a small angular range.
   * Multiple sensors (e.g., 24 spaced at 15° each) are required for full 360° coverage.
2. **Interference:**

   * One sensor’s signal can be received by another nearby sensor.
3. **Reflection Errors:**

   * Angled surfaces cause reflections that make obstacles appear **farther away** than they actually are.

#### **Current Alternatives**

* Sonar sensors are now largely replaced by **laser** or **infrared (IR)** sensors.
* **Laser sensors** are more accurate but typically **heavier, larger, and more expensive**, making them less suitable for small mobile robots.

---

### 2. Infrared (IR) Sensor

#### **Principle**

* Uses a **pulsed infrared LED** (typically at 40 kHz) and a **detection array**.
* The **angle of reflection** of the IR beam varies with the **distance to the object**.

#### **Why IR Sensors Don’t Use Time-of-Flight**

* The **speed of light** is extremely high, so the ToF would be **too short** to measure accurately with low-cost, small sensors.

#### **Types of IR Light Detectors**

1. **IR Detector Cards**
2. **IR-Sensitive Cameras**

#### **Common IR Sensor Models**

| Model        | Output Type      | Description                                         |
| ------------ | ---------------- | --------------------------------------------------- |
| Sharp GP2D12 | Analog           | Voltage output varies with distance                 |
| Sharp GP2D02 | Digital (serial) | 8-bit serial output triggered by a CPU clock signal |

> [!Note]
> The GP2D02 sensor transmits an 8-bit distance value over a single data line, synchronized by a clock signal from the CPU.

#### **Sensor Output Behavior**

<p align="center">
  <img src="assets/raw output of digital IR.png" width="400"><br>
  <em>Figure 1: IR Sensor Output Voltage vs. Distance</em>
</p>

#### **Challenges**

1. **Nonlinearity:**

   * The voltage–distance relationship is nonlinear.
   * Requires a **lookup table (LUT)** (e.g., 256 entries for an 8-bit sensor), calibrated per sensor.
2. **Ambiguity at Close Range:**

   * Distances below ~6 cm may yield **duplicate output voltages**.
   * To prevent this, mount the sensor so obstacles cannot approach closer than 6 cm.

#### **IR Proximity Sensors**

* Simpler than Position Sensitive Detector PSD-type sensors.
* **Binary output (0 or 1)** — acts like a **tactile sensor** that detects the presence or absence of an object.

---

### 3. Compass Sensor

#### **Self-Localization**

Determining a robot’s **position and orientation** in its environment.

#### **Dead Reckoning Method**

* Uses **shaft encoders** on the wheels:

  1. One encoder per wheel.
  2. Start from a known position and orientation.
  3. Integrate all movements to estimate current position.

> [!Caution]
> Wheel slippage causes cumulative errors — position estimates become increasingly inaccurate over time.

#### **Improved Methods**

* Use a **compass sensor** for **absolute orientation**.
* Combine with **GPS** for **global position tracking**.

#### **Compass Types**

| Type                | Description                                      |
| ------------------- | ------------------------------------------------ |
| **Analog Compass**  | 8-direction output represented by voltage levels |
| **Digital Compass** | High resolution (~1° accuracy)                   |

---

###  4. Accelerometer and Gyroscope Sensors

#### **Overview**

* Together called **Inertial Sensors** or **Inertial Trackers**.
* Modern designs use **Micro-Electro-Mechanical Systems (MEMS)** technology.
* Used to measure **orientation**, **acceleration**, and **angular velocity**.

#### **Applications**

* Orientation tracking for:

  * Tracked robots 
  * Balancing robots
  * Walking robots
  * Autonomous aerial robots

> [!Note]
> Typically, **multiple sensors** (2 or 3 of the same model) are combined to measure multi-axis motion.

---

#### **Sensor Categories**

| Sensor            | Function                                    | Example Models                    | Output Type  |
| ----------------- | ------------------------------------------- | --------------------------------- | ------------ |
| **Accelerometer** | Measures linear acceleration along one axis | ADXL05 (1-axis), ADXL202 (2-axis) | Analog / PWM |
| **Gyroscope**     | Measures angular velocity about one axis    | HiTec GY130 Piezo Gyro            | PWM          |
| **Inclinometer**  | Measures absolute tilt angle about one axis | Seika N3, N3D                     | Analog / PWM |

---

#### **How They Work**

* **Accelerometer:** Measures acceleration (**a**) along X, Y, Z.
* **Gyroscope:** Measures angular velocity (**ω**) around X, Y, Z.
* Combined, they form a **complete inertial measurement unit (IMU)**.

##### **Integration Principle**

* Gyroscope data (ω) is **integrated over time** to find **orientation angle (θ)**.
* Accelerometer data (a) is **double-integrated** to determine **position**, after compensating for **gravity**.

##### **Digital Implementation**

* Integration is done using **digital accumulators (summing registers)**.
* The combination of **three gyroscopes** and **three accelerometers** allows full **3D motion tracking** (yaw, pitch, roll).

---

#### **Example: MPU6050 Sensor Module**

* **6-axis motion tracking device**:

  * 3-axis accelerometer
  * 3-axis gyroscope
  * Digital Motion Processor (DMP)
* Additional features:

  * On-chip **temperature sensor**
  * **I²C interface** for microcontroller communication
  * **Auxiliary I²C** port for other sensors (e.g., 3-axis magnetometer, pressure sensor)
* When connected to a magnetometer, it can provide **9-axis motion fusion output**.

---

### 5. Inclinometers (Tilt Sensors)

* Measure **absolute orientation angle** within a defined range.
* Output can be **analog voltage** or **PWM signal**.

#### **Pros and Cons**

* **Pros:**

  * Measure absolute angle (not rate), making them accurate for static orientation.
* **Cons:**

  * **Lag and oscillation** in presence of vibration or noise (e.g., servo jitter).
  * **Slower response**, making them unsuitable for fast control systems like balancing robots.

> [!TIP]
> Combine **inclinometer** (for steady-state accuracy) and **gyroscope** (for fast response) to achieve optimal orientation tracking.

---

### 6. Digital Cameras in Robotics

* Among the **most complex sensors** used in robotics.
* Historically avoided in embedded systems due to high **processing** and **memory** demands.

#### **Key Considerations**

* **High frame rate** is crucial for mobile robots to capture rapidly changing environments.
* **Resolution** is less critical — even **60×80 pixels** can be sufficient for:

  * Object detection
  * Color-based tracking
  * Obstacle detection (e.g., robot soccer)

<p align="center">
  <em>Even low-resolution images (60×80) can effectively detect objects or obstacles for small robots.</em>
</p>

---

### **Summary**

| Sensor Type       | Measures                | Example Models        | Notes                                |
| ----------------- | ----------------------- | --------------------- | ------------------------------------ |
| **Sonar**         | Distance via sound      | HC-SR04               | Inexpensive but less precise         |
| **IR**            | Distance via reflection | Sharp GP2D02 / GP2D12 | Sensitive to surface color and angle |
| **Compass**       | Orientation (absolute)  | HMC5883L              | Good for navigation                  |
| **Accelerometer** | Linear acceleration     | ADXL202               | Used for motion sensing              |
| **Gyroscope**     | Angular velocity        | GY130, MPU6050        | Needed for orientation tracking      |
| **Inclinometer**  | Tilt angle (absolute)   | Seika N3              | Slow response                        |
| **Camera**        | Visual data             | USB / CMOS module     | Used for vision-based robotics       |

