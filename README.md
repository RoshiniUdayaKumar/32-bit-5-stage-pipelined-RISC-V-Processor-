# IMPLEMENTATION OF SINGLE-CYCLE RISC-V PROCESSOR 

## CONTENTS 
- [Introduction to RISC-V ISA](#introduction-to-risc-v-isa)
- [Datapath](#datapath)
  - [Register File](#register-file)
  - [Data Memory](#data-memory)
  - [ALU and ALU Control Unit](#alu)
  - [Control Unit](#control-unit)
  - [Program Counter](#program-counter)
  - [Instruction Memory](#instruction-memory)
  - [Immediate Generator](#immediate-generator)
- [Control Path](#control-path)
- [Complete Design Flow](#complete-design-flow)
- [Result](#result)
- [Tools Used](#tools-used)
- [Further Improvements](#further-improvements)


## Introduction to RISC-V ISA

**Reduced Instruction Set Architecture (RISC-V)**

- Single-cycle implementation (each instruction executes in one clock cycle).
- Fixed instruction length.
- Load-store (register-register) architecture.
- Implements the 32-bit RISC-V Integer Base ISA (RV32I).
- Design is divided into:
  - Datapath
  - Control Path

---

## Datapath

The datapath consists of the hardware blocks responsible for processing data during instruction execution.

Components:
- Program Counter (PC)
- Instruction Memory
- Register File
- ALU
- Data Memory
- Immediate Generator
- Multiplexers

---

### Register File

The register file is a small, high-speed storage unit inside the CPU used to hold CPUs current working data.

<p align="center">
<img src="https://github.com/user-attachments/assets/07cb8715-e80a-49c6-82f9-6fba0d688a74" width="450">
</p>

**Specifications**

- 32 registers (`x0`–`x31`), each 32 bits wide.
- Two asynchronous read ports (`BusA` and `BusB`).
- One synchronous write port (`BusW`) (writes on the negative edge of the clock).
- Two read address inputs (`Ra`, `Rb`). 
- One write address input (`Rw`).
- `BusA` and `BusB` provide read data.
- `BusW` provides write data.
- `RegWr` is the write enable signal.
- Register `x0` is hardwired to `0`; writes are ignored to the 0th register. Trying to read from the 0th register returns 0.

---

### Data Memory

Stores program data and is accessed by **load** and **store** instructions.

- **Load:** Reads data from memory and writes it to the register file.
- **Store:** Writes data from the register file to memory.
- Located outside the CPU and provides much larger storage than the register file (typically KB to MB).
- Used to store complex data such as arrays and vectors.

<p align="center">
<img src="https://github.com/user-attachments/assets/d5e6ebc7-3344-46c2-8ea3-4af1de1bfad6" width="450">
</p>

**Specifications**
- Single-port memory with one address bus (`data_mem_addr`).
- One synchronous read port (`read_data`).
- One synchronous write port (`write_data`).
- Read occurs on the **positive edge** of the clock when `MemRead` is HIGH.
- When `MemRead` is LOW, `read_data` retains its previous value.
- Write occurs on the **negative edge** of the clock when `MemWrite` is HIGH.

---

### ALU

The Arithmetic Logic Unit (ALU) is a combinational circuit that performs arithmetic and logical operations on the input operands.

- Operands are received from the register file through `BusA` and `BusB`.
- Performs arithmetic and logical operations for register-type instructions.
- Computes effective addresses for load/store instructions.
- Calculates branch target comparisons.

<p align="center">
<img src="https://github.com/user-attachments/assets/af5d5f39-b3cd-4465-938b-621c61b80551" width="450">
</p>

**Specifications**
- Two 32-bit input operands (`BusA` and `BusB`).
- One 32-bit output (`BusW`).
- `Zero` output is asserted when the ALU result is zero.
- 4-bit control signal (`ALUCtrl`) selects the required ALU operation.

<table>
  <tr>
    <th>ALU Control</th>
    <th>Operation</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>4'b0000</code></td>
    <td><b>ADD</b></td>
    <td>Signed addition</td>
  </tr>
  <tr>
    <td><code>4'b0001</code></td>
    <td><b>SUB</b></td>
    <td>Signed subtraction</td>
  </tr>
  <tr>
    <td><code>4'b0010</code></td>
    <td><b>AND</b></td>
    <td>Bitwise AND operation.</td>
  </tr>
  <tr>
    <td><code>4'b0011</code></td>
    <td><b>OR</b></td>
    <td>Bitwise OR operation.</td>
  </tr>
  <tr>
    <td><code>4'b0100</code></td>
    <td><b>NOR</b></td>
    <td>Bitwise NOR operation.</td>
  </tr>
  <tr>
    <td><code>4'b0101</code></td>
    <td><b>SLL</b></td>
    <td>Logical left shift.</td>
  </tr>
  <tr>
    <td><code>4'b0110</code></td>
    <td><b>SRL</b></td>
    <td>Logical right shift.</td>
  </tr>
  <tr>
    <td><code>4'b0111</code></td>
    <td><b>SRA</b></td>
    <td>Shift right arithemtic</td>
  </tr>
</table>

#### ALU CONTROL UNIT
It is an intermediate block between the main control unit and the ALU.
The ALU control unit generates the ALU control signal by looking at the ALUOp, funct3, and funct7.
The function codes decide which operation the ALU needs to perform.
The ALUOp will decide the instruction layout.

<p align="center">
<img src="https://github.com/user-attachments/assets/e26102b6-5ffd-4e09-88a5-2de30931ef2f" width="450">
</p>


`ALUOp` is a 2-bit signal
<h3>ALUOp Encoding</h3>

<table border="1">
  <tr>
    <th>ALUOp</th>
    <th>Instruction Type</th>
    <th>ALU Operation</th>
  </tr>
  <tr>
    <td><code>2'b00</code></td>
    <td>Load (<code>LW</code>), Store (<code>SW</code>), Jump</td>
    <td>Addition (Address calculation)</td>
  </tr>
  <tr>
    <td><code>2'b01</code></td>
    <td>Branch (<code>BEQ</code>)</td>
    <td>Subtraction (Comparison)</td>
  </tr>
  <tr>
    <td><code>2'b10</code></td>
    <td>R-type </td>
    <td>Operation determined by <code>funct3</code> and <code>funct7</code></td>
  </tr>
  <tr>
    <td><code>2'b11</code></td>
    <td>I-type</td>
    <td>Operation determined by <code>funct3</code> and <code>funct7</code></td>
  </tr>
</table>

`funct3` is a 3-bit signal

`funct7` is a 7-bit signal 
<p align="center">
<img alt="image" src="https://github.com/user-attachments/assets/7869c54d-0749-4307-9e25-b5690d37c0b1" width="650">
</p>

## Complete Design Flow

<img alt="image" src="https://github.com/user-attachments/assets/164cefc1-03c5-4c0c-99a9-16104ac5f9ef" width="650" />

---
## Results

After verifying how each component works/updates for R/I/S/B/J-type instructions, lets evaluate the performance of the single cycle processor. 

The performance is calculated as: CPU Time = Instruction count X Cycles per instruction X clock period 

Instruction count(IC): The number of instructions the program executes. 

Cycles per instruction (CPI): The number of cycles it takes to execute all the instructions. 

For a single-cycle processor, every instruction takes exactly 1 clock cycle to execute. 

Thus, the number of instructions = the number of clock cycles.

Calculating CPI= cycles/instructions 

In our implementation, we have considered 31 instructions. So, 31 clock cycles are required to execute 31 instructions. 

CPI= 31/31 

CPI=1

So, for a single-cycle processor, the CPI will always be 1.

Average CPI=1

---

## Tools Used 
- Vivado 2018.3 for implementation, verification, and simulation.
- Venus as a RISC-V assembler

---

## Further Improvements 
- Converting a single-cycle processor to a 5-stage pipelined processor.
- Implementing a data forwarding technique to avoid data dependencies.
- Implementing a hazard detection unit to identify lw/sw instructions.
- Implementing branch resolution techniques to avoid branch hazards.
- Comparing the overall performance of a pipelined processor against the single-cycle processor. 

