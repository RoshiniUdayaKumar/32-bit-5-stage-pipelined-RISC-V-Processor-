# IMPLEMENTATION OF SINGLE-CYCLE RISC-V PROCESSOR 

## CONTENTS 
- [Introduction to RISC-V ISA](#introduction-to-risc-v-isa)
- [Datapath](#datapath)
  - [Register File](#register-file)
  - [ALU](#alu)
  - [Data Memory](#data-memory)
- [Control Path](#control-path)
- [Complete Design Flow](#complete-design-flow)
- [Result](#result)
- [Tools Used](#tools-used)
- [Further Improvements](#further-improvements)


## Introduction to RISC-V ISA

**Reduced Instruction Set Architecture (RISC-V)**

- Single-cycle implementation (each instruction executes in one clock cycle).
- Fixed 32-bit instruction length.
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

The register file is a small, high-speed storage unit inside the CPU used to hold operands and intermediate results.

<p align="center">
<img src="https://github.com/user-attachments/assets/07cb8715-e80a-49c6-82f9-6fba0d688a74" width="450">
</p>

**Specifications**

- 32 registers (`x0`–`x31`), each 32 bits wide.
- Two asynchronous read ports (`rs1`, `rs2`).
- One synchronous write port (`rd`) (writes on the negative edge of the clock).
- Two read address inputs (`Ra`, `Rb`).
- One write address input (`Rw`).
- `BusA` and `BusB` provide read data.
- `BusW` provides write data.
- `RegWr` is the write enable signal.
- Register `x0` is hardwired to `0`; writes are ignored.

### DATA MEMORY


