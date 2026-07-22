# IMPLEMENTATION OF SINGLE-CYCLE RISC-V PROCESSOR 

## CONTENTS 
- [Introduction to RISC-V ISA](#introduction-to-risc-v-isa)
- [Datapath](#datapath)
  - [Register File](#register-file)
  - [Data Memory](#data-memory)
  - [ALU and ALU Control Unit](#alu)
  - 
 
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
