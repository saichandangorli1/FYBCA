# Hypothetical Opcodes for Example Machine

This section provides a reference table for the hypothetical opcodes used in the program execution example in the presentation (Figure 3.5 and 3.4).

**Opcode Table:**

These opcodes are for a simplified, hypothetical machine used for illustrative purposes. Real-world microprocessors have much more complex and extensive instruction sets.

| Instruction Category       | Instruction | Opcode (Hexadecimal) | Opcode (Binary) | Description                                    |
| :------------------------- | :---------- | :------------------- | :-------------- | :--------------------------------------------- |
| **Arithmetic Instructions** | ADD         | `1`                  | `0001`          | Add to Accumulator (AC) from memory          |
|                            | SUB         | `A` (10)             | `1010`          | Subtract from AC from memory                   |
|                            | MUL         | `B` (11)             | `1011`          | Multiply AC by value from memory              |
|                            | DIV         | `4` (100)            | `0100`          | Divide AC by value from memory                 |
| **Data Transfer Instructions** | LOAD        | `5` (101)            | `0101`          | Load Accumulator (AC) from memory              |
|                            | STORE       | `6` (110)            | `0110`          | Store Accumulator (AC) to memory               |
|                            | MOVE        | `7` (111)            | `0111`          | Move data (details not specified in presentation) |
| **Control Instructions**    | JMP         | `8` (1000)           | `1000`          | Jump to address                                |
|                            | JZ          | `9` (1001)           | `1001`          | Jump if Zero (condition based jump)            |
|                            | CALL        | `A` (1010)           | `1010`          | Call subroutine                                |
|                            | RET         | `B` (1011)           | `1011`          | Return from subroutine                         |
| **Logical Instructions**    | AND         | `C` (1100)           | `1100`          | Logical AND with AC from memory               |
|                            | OR          | `D` (1101)           | `1101`          | Logical OR with AC from memory                |
|                            | XOR         | `E` (1110)           | `1110`          | Logical XOR with AC from memory               |
|                            | NOT         | `F` (1111)           | `1111`          | Logical NOT (complement) of AC                 |

**Notes:**

*   **4-bit Opcode:**  As mentioned earlier, the hypothetical machine uses a 4-bit opcode field in its instructions. This allows for a maximum of 2<sup>4</sup> = 16 different opcodes, which is reflected in this table.
*   **Simplified Set:** This is a very basic instruction set, designed to illustrate fundamental concepts. Real processors have hundreds or even thousands of instructions to handle a wide range of operations.
*   **Accumulator-Based:** Many instructions in this set are designed to operate on the Accumulator (AC), which is the single data register in this hypothetical CPU.
*   **Address Field:** Instructions that require a memory operand (like LOAD, STORE, ADD, etc.) would use the 12-bit address field in the instruction format to specify the memory location.

**Purpose of the Table:**

This table serves as a reference to understand the opcodes used in the example program execution and to get a basic idea of the types of instructions a CPU can perform (arithmetic, data transfer, control, logical). It's important to remember that this is a simplified example for learning purposes.

**In Summary:**

This table provides a quick lookup for the hypothetical opcodes used in the presentation's example. It helps in understanding the instruction format and the basic functionalities of a very simplified CPU instruction set.