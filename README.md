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

The testbench is self-checking: it runs each instruction for one clock, compares `reg_a` and `reg_b` with the expected values, and prints PASS or FAIL. It also covers 4-bit wraparound and an undefined opcode.

With Icarus Verilog:

```bash
iverilog -o cpu alu.v mini_cpu.v mini_cpu_tb.v
vvp cpu
```

ModelSim and Vivado work the same way: add the three files and simulate `mini_cpu_tb`. I originally validated the design in ModelSim with a display-only testbench. The checks in this version have not been run in a simulator yet.

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
