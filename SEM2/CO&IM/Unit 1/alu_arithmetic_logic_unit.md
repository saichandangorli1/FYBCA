# Arithmetic and Logic Unit (ALU)

This section delves into the Arithmetic and Logic Unit (ALU), a fundamental component within the CPU responsible for performing arithmetic and logical operations.

**What is the ALU?**

*   **Core Computational Unit:** The ALU is the digital circuit within the CPU that performs all arithmetic (addition, subtraction, multiplication, division, etc.) and logical operations (AND, OR, NOT, XOR, comparisons, etc.).
*   **Data Processing Engine:** It's the engine that manipulates data according to the instructions given to the CPU.
*   **Inputs and Outputs:** The ALU takes binary data as input, performs an operation based on control signals, and produces a binary result as output. It also often produces status flags (like carry, zero, overflow) that indicate conditions about the result.

**Building Blocks of the ALU: Adders**

The presentation starts by explaining basic adders, which are fundamental building blocks for arithmetic operations in the ALU.

**1. Half Adder:**

*   **Purpose:** A half adder is a simple digital circuit that adds **two single binary digits (bits)**, let's call them A and B.
*   **Outputs:** It produces two outputs:
    *   **Sum (S):** The sum of A and B (also a single bit).
    *   **Carry (C):**  The carry-out bit, which is generated if the sum of A and B is 2 or greater (in binary addition, 1+1 = 10, so the carry is '1').
*   **Logic Gates for Half Adder (from Presentation Diagram):**

    ```
          A -----\
                 \ XOR Gate ---- S (Sum)
          B -----/
                 \ AND Gate ---- C (Carry)
          A -----/
    ```

*   **Truth Table for Half Adder:**

    | Input A | Input B | Output Sum (S) | Output Carry (C) |
    | :------ | :------ | :------------- | :-------------- |
    | 0       | 0       | 0              | 0               |
    | 0       | 1       | 1              | 0               |
    | 1       | 0       | 1              | 0               |
    | 1       | 1       | 0              | 1               |

*   **Explanation:**
    *   0 + 0 = 0, Carry 0
    *   0 + 1 = 1, Carry 0
    *   1 + 0 = 1, Carry 0
    *   1 + 1 = 10 (binary) = 2 (decimal), Sum bit is 0, Carry bit is 1.

**2. Full Adder:**

*   **Purpose:** A full adder is an extension of the half adder. It adds **three single binary digits:** two input bits (A and B) and a **Carry-in bit (Cin)** from a previous stage of addition.
*   **Outputs:**  It also produces two outputs:
    *   **Sum (S):** The sum bit.
    *   **Carry-out (Cout):** The carry bit to be passed to the next stage of addition (for multi-bit numbers).
*   **Logic Gates for Full Adder (from Presentation Diagram):**

    ```
          A -----\
                 \ XOR Gate -----\
          B -----/              \
                                \ XOR Gate ---- S (Sum)
          Cin ----/              /
                                /
          A -----\              /
                 \ AND Gate -----
          B -----/              \
                                \ OR Gate ---- Cout (Carry-out)
          A -----\              /
                 \ XOR Gate -----/
          B -----/
          Cin ---/
    ```

*   **Truth Table for Full Adder:**

    | Input A | Input B | Carry-in (Cin) | Output Carry-out (Cout) | Output Sum (S) |
    | :------ | :------ | :------------- | :---------------------- | :------------- |
    | 0       | 0       | 0              | 0                       | 0              |
    | 0       | 0       | 1              | 0                       | 1              |
    | 0       | 1       | 0              | 0                       | 1              |
    | 0       | 1       | 1              | 1                       | 0              |
    | 1       | 0       | 0              | 0                       | 1              |
    | 1       | 0       | 1              | 1                       | 0              |
    | 1       | 1       | 0              | 1                       | 0              |
    | 1       | 1       | 1              | 1                       | 1              |

*   **Explanation:** The full adder correctly handles the carry from previous additions, allowing for multi-bit binary addition.

**Building a 1-bit ALU:**

The presentation shows how to construct a simple 1-bit ALU that can perform:

*   **Arithmetic Operation:** 1-bit addition (SUM).
*   **Logical Operations:** AND, OR, XOR.

*   **Diagram of 1-bit ALU (Figure from Presentation):**

    ```
          B0 ---
          A0 ---
          Cin ---
                 +-------+
                 | Full  | ---- Cout
                 | Adder |
                 +-------+
                 |       |
                 +-------+
          B0 ---| AND   |---
          A0 ---| Gate  |   \
                 +-------+    \
          B0 ---| OR    |     >--- 4:1 MUX ---- F0 (Output)
          A0 ---| Gate  |    /
                 +-------+   /
          B0 ---| XOR   |--/
          A0 ---| Gate  |
                 +-------+
          M1 --- (MUX Select Lines)
          M0 --- (MUX Select Lines)
    ```

*   **Components:**
    *   **Full Adder:** For addition.
    *   **AND Gate, OR Gate, XOR Gate:** For logical operations.
    *   **4-to-1 Multiplexer (MUX):**  Selects which operation's output will be the final output (F0) of the 1-bit ALU based on the **selection lines M1 and M0**.

*   **Input/Output Table for 1-bit ALU:**

    | M1 | M0 | Operation Selected |
    | :--- | :--- | :----------------- |
    | 0  | 0  | SUM (Addition)     |
    | 1  | 0  | AND                |
    | 0  | 1  | OR                 |
    | 1  | 1  | XOR                |

**Building a 4-bit ALU:**

*   **Recursive Construction:** A 4-bit ALU can be built by **connecting four 1-bit ALUs** together.
*   **Carry Chain:** The **Carry-out (Cout)** of each 1-bit ALU is connected to the **Carry-in (Cin)** of the next more significant 1-bit ALU, forming a carry chain for multi-bit addition.

*   **Diagram of 4-bit ALU (Figure from Presentation):**

    ```
     M0   M0   M0   M0  (MUX Select Lines - same for all 1-bit ALUs)
     |    |    |    |
    +---+---+---+---+
    |   |   |   |   |
    A0--|   |   |   |   +--------+
    B0--| 1-| 1-| 1-| 1-|        |
    Cin1->bit bit bit bit|   F0   |--
        | ALU| ALU| ALU| ALU|        |
    A1--|   |   |   |   +--------+
    B1--|   |   |   |   |   F1   |--
        |   |   |   |   +--------+
    A2--|   |   |   |   |   F2   |--
    B2--|   |   |   |   +--------+
        |   |   |   |   |   F3   |--
    A3--|   |   |   |   +--------+
    B3--|   |   |   |
        +---+---+---+---+
            |   |   |
            +---+---+---- Cout3 (Final Carry-out)
    ```

**Important Takeaways (from Presentation):**

*   **Selection Lines (M0, M1):** These lines control which operation the ALU performs. By changing the values on these lines, you can switch between addition, AND, OR, XOR, etc.
*   **Instruction Set Formation:**  The combination of these selection lines, input arguments (A and B), and the desired functions (SUM, AND, OR, XOR) forms the basis of an **Instruction Set**.
*   **Programs from Instructions:** These instructions can be used to create meaningful programs by combining them in sequences to perform complex tasks.
*   **ROM for Instructions:** Instructions (opcodes and control signals) are often stored in ROM (Read-Only Memory) within the CPU's control unit. ROM is used because instructions need to be readily available and are typically fixed.
*   **Registers for Operands:** Input arguments (A and B) for the ALU are often provided from **Internal Registers** within the CPU. These registers, along with special-purpose registers, form the register set of the microcontroller/CPU.
*   **RAM for Intermediate Data:** While ROM stores instructions, **RAM (Random Access Memory)** is used for storing data that changes during program execution, including intermediate results and variables. RAM is faster for read/write operations than ROM.

**In Summary:**

The ALU is the heart of the CPU's processing capability. It performs arithmetic and logical operations on binary data. Basic adders (half adder, full adder) are fundamental building blocks for arithmetic operations. By combining adders with logic gates and multiplexers, we can construct a functional ALU that can perform a variety of operations. The ALU, controlled by instruction opcodes and using data from registers and memory, is essential for executing computer programs.