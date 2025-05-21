# ELTD15A - Digital Systems Laboratory Project: Shift-and-Add Multiplier

## Project Overview
This project implements a **4-bit shift-and-add multiplier** using Verilog, following a hierarchical design approach. The multiplier is composed of interconnected modules (ACC, CONTROL, Counter, and Adder) and utilizes behavioral and structural descriptions. The project was developed using Quartus Prime and ModelSim-Altera for synthesis and simulation, targeting the MAX10 10M50DAF484C7G FPGA.


---

## Group Members
- **Gabriel Del Monte Schiavi Noda**  
  [GitHub Profile](https://github.com/GabrielDelMonte)
- **Gabrielle Gomes Almeida**  
  [GitHub Profile](https://github.com/gavgms12)
- **Leonardo José Siqueira Marinho**  
  [GitHub Profile](https://github.com/Lion4rdo)


---

## Project Structure
### Repository Organization
```text
Multiplicador/
├── Multiplicador.v    // Top-level module (structural description)
├── Multiplicador_TB.v // Testbench for the multiplier
├── Adder/
│ ├── Adder.v          // 4-bit adder module
│ └── Adder_TB.v       // Testbench for Adder
├── ACC/
│ ├── ACC.v            // Accumulator module (shift and load logic)
│ └── ACC_TB.v         // Testbench for ACC
├── CONTROL/
│ ├── CONTROL.v        // Finite State Machine (FSM) controller
│ └── CONTROL_TB.v     // Testbench for CONTROL
└── Counter/
  ├── Counter.v        // Shift counter module
  └── Counter_TB.v     // Testbench for Counter
```

---

## Key Modules
### 1. Multiplicador (Top Module)
- **Description**: Integrates all sub-modules (ACC, CONTROL, Counter, Adder) to perform 4-bit multiplication using the shift-and-add algorithm;
- **Inputs**: `Clk`, `St` (start), `Multiplicando` (4-bit multiplicand), `Multiplicador` (4-bit multiplier);
- **Outputs**: `Produto` (8-bit product), `Done`, `Idle`.

### 2. ACC (Accumulator)
- **Function**: Stores intermediate results, shifts right, and loads values based on control signals (`Load`, `Sh`, `Ad`);
- **Width**: 9 bits (upper 5 bits for sum, lower 4 bits for multiplier).

### 3. CONTROL
- **States**: `Idle`, `Load`, `Add`, `Shift`, `Done`.
- **Signals**: Generates `Load`, `Ad`, `Sh` based on `St`, `M` (LSB of multiplier), and `K` (shift counter flag).

### 4. Counter
- **Role**: Tracks the number of shifts;
- **Output**: `K` flag signals completion after 6 iterations.


---

## Simulation & Synthesis
### Compilation Steps (Quartus Prime)
1. **Create Projects for Each Module**:
   - Save each module (ACC, CONTROL, etc.) in its own folder with `.qsf` and `.apf` files.
2. **Add Files to Top Project**:
   - In the `Multiplicador` project, navigate to *Project → Add/Remove Files in Project* and include all sub-module Verilog files (if necessary).
3. **Compile and Synthesize**:
   - Ensure no errors in hierarchy or port connections.  

### Testbench Examples
- **Multiplicador_TB.v**: Tests 3x5=15, 7x7=49, and 12x3=36.  
- **Counter_TB.v**: Validates shift counter behavior (4 iterations).  


---

## Results
| Test Case | Expected Result | Simulation Output |
|-----------|-----------------|-------------------|
| 3 × 5     | 15 (0b00001111) | 15                |
| 7 × 7     | 49 (0b00110001) | 49                |
| 12 × 3    | 36 (0b00100100) | 36                |


---

## References
- [**Guide03.pdf**](https://github.com/GabrielDelMonte/Multiplier_ShiftAdd/blob/main/guides/Guide03.pdf): Methodology for hierarchical design and FPGA integration.  
- [**Guide04.pdf**](https://github.com/GabrielDelMonte/Multiplier_ShiftAdd/blob/main/guides/Guide04.pdf): ASM charts, state diagrams, and multiplier algorithm details.  
