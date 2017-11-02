## Bài 1

1. 
2. l
3. a
4. 
5. c
6. z
7. b
8. 
9. 
10. 
11. k
12. e
13. f
14. 
15. m
16. v
17. 
18. s
19. p
20. x
21. 
22. y
23. w
24. u
25. 
26. 





## Bài 2

Configuration | Resolution | Main Memory | Ethernet Network
---------|----------|---------|---------
 1 | 640x480 | 2Gbytes | 100Mbit / s
 2 | 1280x1024 | 4Gbytes | 1Gbit / s

a. Mỗi màu được biểu diễn 8-bit, mỗi pixel gồm 3 màu cơ bản (đỏ, xanh, lam). Xác định dung lượng tối thiểu của mỗi khung hình.

b. Chứa tối đa bao nhiêu khung hình?

```
configuration 1: 
maxPixel = 640 * 480 = 307200
maxMem = maxPixel * 3 * 8  = 7372800
7372800 (bit) ~ 900 KB ~ 0.000858306884765625 GB
maxFrame = 2 / 0.000858306884765625 = 2330 frames
```

```
configuration 2:
maxPixel = 1280 * 1024 = 1310720
maxMem = maxPixel * 3 * 8  = 31457280
31457280 (bit) ~ 3840 KB ~ 0.003662109375 GB
maxFrame = 4 / 0.003662109375 = 1092 frames
```

c. Truyền file 256KB qua đường Ethernet mất bao lâu?

```
configuration 1:
256 KB = 2 Mbit
takes 2 / 100 = 0.02 (s)
```

```
configuration 2:
256 KB = 0.001953125 Gbit
takes 0.001953125 (s)
```

## Bài 3

Processor | Clock rate | CPI
----------|------------|----
P1 | 3GHz | 1.5
P2 | 2.5GHz | 1.0
P3 | 4GHz | 2.2

```
P1_IPS = 3E+9 / 1.5 = 2E+9
P2_IPS = 2.5E+9 / 1 = 2.5E+9
P3_IPS = 4E+9 / 2.2 = 1.82E+9
```

```
IC = CPU_time * f / CPI

IC_1 = 10 * 3E+9 / 1.5 = 20 E+9
IC_2 = 10 * 2.5E+9 / 1 = 25 E+9
IC_3 = 10 * 4E+9 / 2.2 = 18.2 E+9
```

```
70% * 10s = 7s
P1:
CPI = 120% * 1.5 = 1.8
f = IC_1 * CPI / CPU_time = 20 * 1.8 E+9 / 7  = 36/7 GHz

P2:
CPI = 120% * 1.0 = 1.2
f = IC_1 * CPI / CPU_time = 25 * 1.2 E+9 / 7  = 40/7 GHz

P3:
CPI = 120% * 2.2 = 2.64
f = IC_1 * CPI / CPU_time = 2.64 * 20 E+9 / 7  = 264/35 GHz
```

## Bài 4


Processor | Clock rate | No. Instructions | Time
----------|------------|------------|------------
P1 | 3 GHz | 2.00E+10 | 7s
P2 | 2.5 GHz | 3.00E+10 | 10s
P3 | 4 GHz | 9.00E+10 | 9s

```
IPC = I / (t / T) = I / (tf)
IPC_1 = 2.00E+10 / (7s * 3E+9Hz) = 20/21
IPC_2 = 3.00E+10 / (10s * 2.5E+9Hz) = 30/25
IPC_3 = 9.00E+10 / (9s * 4E+9Hz) = 10/4
```

```
t_2 = 7s
f = I / (t * IPC) = 3.00E+9 / (7 * 3/25) = 25/7 GHz
```

```
t_2 = 9s
I = IPC * t * f = 30/25 * 9 * 2.5 E+9 = 27 E+9
```


## Bài 5

Processor | Clock rate | CPI Class A | CPI Class B | CPI Class C | CPI Class D
----------|------------|-------------|-------------|-------------|------------
P1 | 2.5 GHz | 1 | 2 | 3 | 3
P2 | 3 GHz | 2 | 2 | 2 | 2

- I = 10^6
- f_A = 10% => I\_A = 10^5
- f_B = 20% => I\_B = 2 * 10^5
- f_C = 50% => I\_C = 5 * 10^5
- f_D = 20% => I\_D = 2 * 10^5

```
P1_C = 10^5 + 2 * 2 * 10^5 + 3 * 5 * 10^5 + 3*2 * 10^5 = 2.6 * 10^6
=> t1 = P1_C * T = 0.00104 s
=> CPI_tb = P1_C / I = 2.6
P2_C = 2 * 10^6
=> t2 = P2_C * T = 0.0008 s
=> CPI_tb = P2_C / I = 2
```

## Bài 6

Arith | Store | Load | Branch | Total
------|-------|------|--------|------
650 | 100 | 600 | 50 | 1400

- f = 2 GHz
- CPI_Arith = 1
- CPI_Store = 5
- CPI_Load  = 5
- CPI_Branch = 2

```
C = 650 + 5 * 100 + 5 * 600 + 2 * 50 = 4250
t = C * T = C / f = 2,125 * 10^-6 s
CPI = C / total = 4250/1400 ~ 3
```

```
C_after =  650 + 5 * 100 + 5 * 300 + 2 * 50 = 2750
speedup = C / C_after = 4250 / 2750 = 17/11 ~ 1.55
```