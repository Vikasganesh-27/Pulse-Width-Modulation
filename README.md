# Pulse-Width-Modulation

## Overview
This project implements a **Pulse Width Modulation (PWM) module** in Verilog. The module generates a PWM signal with a configurable duty cycle, useful for applications such as motor control, LED dimming, and signal modulation.

## Features
- Configurable PWM period
- Adjustable duty cycle
- Reset functionality
- Synchronous operation with a clock signal

## File Structure
- `pwm.v`: Verilog implementation of the PWM module
- `README.md`: Documentation for the project

## Module Description
### Inputs
- `clk` : Clock signal to synchronize the PWM generation.
- `rst` : Active-high reset signal that initializes the PWM module.

### Output
- `dout` : PWM output signal.

### Parameters
- `period` : Defines the total period of the PWM signal (default = 20).

## Functionality
1. The `count` variable increments on each clock cycle.
2. The `ton` value determines the ON time of the PWM signal.
3. When `count <= ton`, the output `dout` is set to HIGH (1).
4. When `count` exceeds `ton`, `dout` is set to LOW (0) until the end of the period.
5. Once a complete period is reached, `count` resets and the duty cycle (`ton`) is updated.

## License
This project is open-source and available under the MIT License.

## Contributions
Contributions are welcome! Feel free to submit issues or pull requests to improve the module.
