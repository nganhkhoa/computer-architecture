# Lab 6
# Kiến trúc máy tính

## Nguyễn Anh Khoa
## 1611617

### Bài 1

PC:
input = new address
output = address holding
function = store address of instruction being loaded

Instruction Memory:
input = address of instruction
output = binary form of instruction
function = store instruction of programme

Register:
input 1: register address
output 1: data of register given
input 2: register address to write data to
input 3: data to write
input 4: write controller
function: access to registry data

ALU:
input 1&2: input for calculation
output 1: result of calculation
output 2: zero flag to compare
input 3: operand controller
function: doing calculation

Data Memory:
input 1: address in memory
input 2: data to write to
output 1: data of address in memory
input 3: write controller
input 4: read controller
function: memory

Control:
input: Code for control
outputs: control setting
function: control what to do when load an instruction

mux:
function: chose between two input

Sign-Extend:
input: 16 bit number
output: 32 bit number sign extended
function: make 32 bit number from 16

### Bài 2

RegDst: Use rt or rd deteminant
RegWrite: Enable to write to register
MemRead: Enable read memory
MemWrite: Enable write memory
MemtoReg: Result from ALU or Mem deteminant
Branch: Branch instruction
Jump: Jump instruction
ALUSrc: rt or imm deteminant

