# 8-Bit Arithmetic Logic Unit (ALU) with 16-Bit Output

# 📌 Project Overview :
This repository contains a synthesizable, high-performance 8-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL. The module processes two 8-bit inputs (Input_A and Input_B) based on a 3-bit operational code (OpCode) to perform a variety of arithmetic, logical, and shift operations.To prevent data truncation and overflow loss during operations like multiplication or left-shifting, the design features a 16-bit wide output bus (OutALU) along with an independent Carry-Out (COut) flag.

# 🛠️ System Architecture & Key Features :
3-Always-Block Clean Design Pattern: The system is explicitly coded using industry-standard RTL design practices that cleanly separate sequential updates, combinational next-state mapping, and output assignment.
Zero Latch Generation Guarantee: Every execution branch explicitly drives both OutALU and COut, featuring a robust default catch-all branch to prevent hazardous combinational latches.

# 📁 Port Descriptions :
Inputs Input_A [7:0]: 8-bit data operand bus A.
 Input_B [7:0]: 8-bit data operand bus B.
 OpCode [2:0]: 3-bit operational mode control selector.
 OutputsOutALU [15:0]: 16-bit primary data output bus (zero-extended for logical/bitwise ops).
 COut: 1-bit active-high arithmetic overflow / carry-out status bit.

<img width="842" height="552" alt="image" src="https://github.com/user-attachments/assets/88fa0aac-9c2e-4bbe-bca8-b2bc996de7b8" />


# The ALU must support the following operations:


<img width="375" height="728" alt="image" src="https://github.com/user-attachments/assets/d41b226d-66c6-4828-aff6-4073d9450187" />
