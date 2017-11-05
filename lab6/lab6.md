# Lab 6
# Kiến trúc máy tính

## Nguyễn Anh Khoa
## 1611617

---
Use monofonts and an appropriate markdown viewer

markdown viewer should be able to handle KaTex

Or view online [here]()
---

### Bài 1

PC:
- input    : new address
- output   : address holding
- function : store address of instruction being loaded

Instruction Memory:
- input    : address of instruction
- output   : binary form of instruction
- function : store instruction of programme

Register:
- input 1 :  register address
- output 1:  data of register given
- input 2 :  register address to write data to
- input 3 :  data to write
- input 4 :  write controller
- function:  access to registry data

ALU:
- input 1&2:  input for calculation
- output 1 :  result of calculation
- output 2 :  zero flag to compare
- input 3  :  operand controller
- function :  doing calculation

Data Memory:
- input 1  : address in memory
- input 2  : data to write to
- output 1 : data of address in memory
- input 3  : write controller
- input 4  : read controller
- function : memory

Control:
- input    : Code for control
- outputs  : control setting
- function : control what to do when load an instruction

mux:
- function : chose between two input

Sign-Extend:
- input    : 16 bit number
- output   : 32 bit number sign extended
- function : make 32 bit number from 16

### Bài 2

- RegDst   : Use rt or rd deteminant
- RegWrite : Enable to write to register
- MemRead  : Enable read memory
- MemWrite : Enable write memory
- MemtoReg : Result from ALU or Mem deteminant
- Branch   : Branch instruction
- Jump     : Jump instruction
- ALUSrc   : rt or imm deteminant



### Bài 3

| OP                    | RegDst | RegWrite | ExtOp | ALUSrc | Beq | Bne | J   | MemRead | MemWrite | MemtoReg |
| --------------------- | ------ | -------- | ----- | ------ | --- | --- | --- | ------- | -------- | -------- |
| lw \$t1, 8(\$t2)      | 0      | 1        | 1     | 1      | 0   | 0   | 0   | 1       | 0        | 1        |
| sw \$t1, 8(\$t2)      | x      | 0        | 1     | 1      | 0   | 0   | 0   | 0       | 1        | x        |
| add \$t1, \$t2, \$t2  | 1      | 1        | x     | 0      | 0   | 0   | 0   | 0       | 0        | 0        |
| beq \$t2, \$t1, Label | x      | 0        | x     | 0      | 1   | 0   | 0   | 0       | 0        | x        |
| sll \$t1, \$t2, 5     | 1      | 1        | 1     | 1      | 0   | 0   | 0   | 0       | 0        | 0        |
| j label               | x      | 0        | x     | x      | 0   | 0   | 1   | 0       | 0        | x        |


### Bài 4

| Phần cứng          |  Delay  |
|--------------------|---------|
| Mux                |  10  ns |
| Add                |  10  ns |
| Shift left         |  10  ns |
| Instruction Memory | 150  ns |
| Registers          | 100  ns |
| Sign Extend        |  10  ns |
| ALU                | 100  ns |
| Data memory        | 150  ns |


- Load

= Instruction Memory + Registers + Sign Extend + Mux (RegDst) + Mux(ALUSrc) + ALU + Data memory + Mux(MemtoReg) + Registers + Mux(PCSrc) 

= 150 + 100 + 10 + 10 + 10 + 100 + 150 + 10 = 550 ns

- Store

= Instruction Memory + Registers + Sign Extend + Mux (ALUSrc) + ALU + Data Memory + Mux(PCSrc) 

= 150 + 100 + 10 + 10 + 100 + 150 + 10 = 530 ns

- ALU

= Instruction Memory + Registers + Mux (RegDst) + Sign Extend + Mux (ALUSrc) + ALU + Registers + Mux(PCSrc) 

= 150 + 100 + 10 + 10 + 10 + 100 + 100 + 10 = 490

- Branch

= Instruction Memory + Register + Mux(ALUSrc) + ALU + Mux(PCSrc) 

= 150 + 100 + 10 + 100 + 10 = 370

- Jump

= Insstruction Memory + Mux(PCSrc) 

= 150 + 10 = 160

Longest Lantancy = Load = 550 ns