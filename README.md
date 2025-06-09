# 4-bit Mini CPU using Verilog

This is a basic 4-bit CPU project I created to practice digital design concepts in Verilog. It’s a simple model that supports a few instructions like MOV, ADD, SUB, AND, OR — using a small ALU and registers.

I made this to revise everything — combinational logic, sequential logic, instruction decoding, and testbench simulation — all in one short project.

---

## Files

- `mini_cpu.v` – Main CPU module (handles registers and instruction execution)
- `alu.v` – ALU that performs basic arithmetic and logic ops
- `mini_cpu_tb.v` – Testbench to simulate different instructions

---

## What it Does

The CPU reads an 8-bit instruction. The top 4 bits are the opcode, and the bottom 4 bits are the operand (like a constant value).

### Supported Instructions

| Opcode  | Instruction | What it does            |
|---------|-------------|--------------------------|
| `0000`  | MOV A, x    | Load x into register A   |
| `0001`  | MOV B, x    | Load x into register B   |
| `0010`  | ADD A, B    | A = A + B                |
| `0011`  | SUB A, B    | A = A - B                |
| `0100`  | AND A, B    | A = A & B                |
| `0101`  | OR A, B     | A = A | B                |

---

## How to Run

I tested this using ModelSim (you can use Vivado too):

1. Load all three files.
2. Compile and simulate the `mini_cpu_tb.v` file.
3. Watch how `reg_a` and `reg_b` change after each instruction.

---

## Why I Made This

I wanted a project that covers all digital design basics:
- ALU (combinational logic)
- Registers and clock (sequential logic)
- Instruction decoding (MUX logic)
- Writing and running a testbench

It’s not complicated, but it helped me revise everything quickly and build something I can put on my resume too.

---

## Made by

Vivek Poddar  
ECE Department  
NIT Kurukshetra

---

## License

You can use or modify this however you want for learning or practice.
