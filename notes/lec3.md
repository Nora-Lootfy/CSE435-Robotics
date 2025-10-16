# CSE435 – Robotics  
## Lecture 3 Notes

---

### What Makes a Machine a Robot

A robot integrates three main functions:

* **Sensing** – perceiving information about its environment.
* **Planning** – deciding what actions to take.
* **Acting** – interacting physically with the environment.

---

### Why Robots Need Sensors

Robots need sensors to:

* Determine **where they are** (localization).
* Avoid **obstacles**.
* Perform **task-specific sensing**, e.g.:

  * Detecting crop lines (for agricultural robots).
  * Detecting and tracking faces (for humanoid robots).

---

### Sensors vs. Detectors

* **Sensor:** Converts a physical quantity (like pressure, light, or temperature) into an electrical signal readable by a controller.
* **Detector:** Includes a sensor and a **decision circuit** that reacts when a threshold is reached (e.g., smoke detector triggers an alarm).

---

### Sensor Selection Factors

Important criteria for choosing a sensor:

* Measurement technique
* Size & weight
* Operating temperature
* Power consumption
* Price range

---

### Sensor Data Transfer

Two main methods:

1. **CPU-Initiated (Polling):** CPU continuously checks sensor status.
2. **Sensor-Initiated (Interrupt):** Sensor notifies CPU when data is ready (more efficient).

---

### Sensor Categories

From an **engineering perspective:** classified by **output type** (analog/digital, binary).
From a **robotic perspective:** classified by **function and location**:

* **Local (on-board)** vs. **Global (external)**
* **Internal (robot’s state)** vs. **External (environment)**
* **Passive** (don’t affect environment, e.g. camera, gyroscope) vs. **Active** (emit signals, e.g. sonar, infrared)

---

### Binary Sensors

Simplest sensors that output **0 or 1**, e.g. touch/tactile sensors.

---

### Analog vs. Digital Sensors

* **Analog Sensors:** Output continuous voltage; require **A/D converter**.
  Examples: microphone, analog IR sensor, barometer.
* **Digital Sensors:** Output digital data via parallel or serial interfaces (RS232, SPI, etc.); usually more accurate.

---

### Example: TC72 Temperature Sensor

* Uses **synchronous serial digital interface**.
* Data transferred bit-by-bit using a **clock line** and **chip select (CS)**.

---

### Shaft Encoders

Provide **feedback for motor control**.

#### Incremental Encoders

* Use optical or magnetic disks with alternating patterns.
* Generate pulses for each segment passed.
* Two sensors (A & B channels) detect **rotation direction** via phase shift.
* Connected to **pulse counting registers** in microcontrollers to avoid constant polling.
* Usually mounted **directly on the motor shaft** for maximum resolution.
* **Do not measure absolute position** — only relative movement.

#### Absolute Encoders

* Measure **true angular position** using a **Gray-code disk** and sensors.
* Each sensor combination corresponds to a unique shaft angle.
* Only one bit changes at a time, reducing read errors.

---

### Analog-to-Digital (A/D) Converters

* Convert analog signals into digital numbers.
* Key parameters:

  * **Resolution:** bits per value (e.g. 10-bit)
  * **Speed:** conversions per second
  * **Range:** input voltage (e.g. 0–5V)
* Output interfaces: **Parallel** or **Synchronous Serial**
* Often include **multiplexers** to read multiple sensors.


