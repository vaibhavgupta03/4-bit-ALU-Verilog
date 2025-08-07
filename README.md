# 4-bit Arithmetic Logic Unit (ALU) - Verilog Implementation

## Overview
This project implements a 4-bit Arithmetic Logic Unit (ALU) in Verilog that performs eight fundamental operations including arithmetic, logical, and shift operations. The design is fully combinational and includes status flags for carry and zero detection.

## Features
- **4-bit data width** for operands and results
- **8 operations** including arithmetic, logical, and shift operations
- **Status flags**: Carry and Zero detection
- **Combinational design** with no clock dependency
- **Comprehensive testbench** with VCD waveform generation
- **Clean, modular code** structure for easy understanding and modification

## ALU Operations

| SEL (2:0) | Operation | Description |
|-----------|-----------|-------------|
| 000       | ADD       | Addition: A + B |
| 001       | SUB       | Subtraction: A - B |
| 010       | AND       | Bitwise AND: A & B |
| 011       | OR        | Bitwise OR: A | B |
| 100       | XOR       | Bitwise XOR: A ^ B |
| 101       | NOT       | Bitwise NOT: ~A |
| 110       | SLL       | Shift Left Logical: A << 1 |
| 111       | SRL       | Shift Right Logical: A >> 1 |

## Module Description

### alu.v - Main ALU Module
```verilog
module alu(
    input [3:0] a,      // 4-bit operand A
    input [3:0] b,      // 4-bit operand B
    input [2:0] sel,    // 3-bit operation selector
    output reg [3:0] result,  // 4-bit result
    output reg carry,   // Carry flag for arithmetic operations
    output reg zero     // Zero flag indicating zero result
);
```

**Key Features:**
- **Combinational logic** implemented using `always @(*)` block
- **Automatic carry detection** for addition operations
- **Zero flag generation** when result equals zero
- **Default case handling** for undefined selector values

### test_alu.v - Testbench Module
```verilog
module tb_alu;
```
**Testbench Features:**
- **Comprehensive testing** of all 8 ALU operations
- **VCD waveform generation** for debugging and visualization
- **Real-time monitoring** with $display and $monitor statements
- **Step-by-step testing** with clear test progression
- **Input pattern testing** with specific test vectors

## Test Vectors
The testbench uses the following test patterns:
- **Addition**: 5 + 3 = 8
- **Subtraction**: 5 - 3 = 2
- **Logical operations**: 5 & 3, 5 | 3, 5 ^ 3
- **NOT operation**: ~5
- **Shift operations**: 3 << 1 = 6, 12 >> 1 = 6

## Usage

### Simulation
To run the simulation and generate waveforms:
```bash
iverilog -o alu_test alu.v test_alu.v
vvp alu_test
gtkwave alu.vcd
```

### Expected Output
```
A    B    SEL | RESULT CARRY ZERO
0101 0011 000 | 1000     0     0
0101 0011 001 | 0010     0     0
0101 0011 010 | 0001     0     0
0101 0011 011 | 0111     0     0
0101 0011 100 | 0110     0     0
0101 0000 101 | 1010     0     0
0011 0000 110 | 0110     0     0
1100 0000 111 | 0110     0     0
```

## Design Considerations
- **Overflow handling**: Carry flag indicates when addition exceeds 4-bit range
- **Zero detection**: Automatic zero flag generation for all operations
- **Extensibility**: Easy to add more operations by extending the case statement
- **Synthesis-friendly**: Uses standard Verilog constructs suitable for FPGA/ASIC implementation

## File Structure
```
4-bit ALU Verilog/
├── alu.v          # Main ALU module
├── test_alu.v     # Testbench module
├── alu_test       # Compiled simulation binary
├── alu.vcd        # Generated waveform file
├── README.md      # This documentation
└── [output files] # Simulation results and screenshots
```

## Future Enhancements
- Add multiplication and division operations
- Implement signed arithmetic operations
- Add overflow and underflow detection
- Include comparison operations (greater than, less than)
- Add pipeline stages for higher performance

## License
This project is open-source and available for educational and commercial use.
