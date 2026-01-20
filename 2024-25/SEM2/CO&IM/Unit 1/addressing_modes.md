# Addressing Modes

This section explains **Addressing Modes**, which are different ways a CPU can specify the location of operands (data) in instructions. Understanding addressing modes is crucial for efficient programming and understanding how instructions access data.

**What are Addressing Modes?**

*   **Operand Access Methods:** Addressing modes are the methods used by the CPU to **access operands (data)** needed for operations during program execution.
*   **Interpreting Operand Addresses:** Different addressing modes provide different ways for the processor to **interpret the address** specified in an instruction. The instruction itself might not directly contain the actual data, but rather information on *how to find* the data.
*   **Efficiency and Flexibility:** The choice of addressing mode impacts the **efficiency** (speed of data access) and **flexibility** (ability to access data in various ways) of the system.

**Categories of Addressing Modes (from Presentation):**

The presentation categorizes addressing modes into three main types:

1.  **Data Addressing Modes:**  Modes where the operand is typically in a CPU register or is an immediate value (constant). These modes are fast and efficient as they directly involve CPU-internal locations.

2.  **Memory Addressing Modes:** Modes where the operand is located in main memory. These modes are used to access data stored in memory. Memory access is generally slower than register access.

3.  **Stack Addressing Modes:** Modes specifically related to stack-based operations, where operands are implicitly accessed from the stack.

**1. Data Addressing Modes:**

These modes are characterized by operands being directly available within the CPU or as part of the instruction itself.

*   **Immediate Addressing Mode:**
    *   **Operand Location:** The **operand value is directly specified in the instruction itself.** The operand is an immediate constant.
    *   **Example (Assembly-like syntax):** `MOV R0, #5`
        *   `MOV`:  Instruction (Move data)
        *   `R0`: Destination register (Register 0)
        *   `#5`: Immediate value (the operand itself is the number 5)
        *   **Meaning:** Load the immediate value `5` into register `R0`.
    *   **Fastest Mode:** Very fast as the operand is immediately available in the instruction.
    *   **Limited Flexibility:** Operand value is fixed at compile time.

*   **Register Addressing Mode:**
    *   **Operand Location:** The **operand is located in a CPU register.** The instruction specifies the register that contains the operand.
    *   **Example:** `ADD R1, R2`
        *   `ADD`: Instruction (Addition)
        *   `R1`: Destination register
        *   `R2`: Source register (operand is in R2)
        *   **Meaning:** Add the **contents of register R2** to the **contents of register R1**, and store the result in `R1`.
    *   **Fast and Efficient:** Register access is very fast.
    *   **Limited Address Space:** Limited to the number of available registers.

*   **Register Indirect Addressing Mode:**
    *   **Operand Location:** The **register contains the *memory address*** of the operand. The instruction specifies the register that holds the address.
    *   **Example:** `MOV R1, (R2)`  (Syntax may vary depending on architecture)
        *   `MOV`: Instruction (Move)
        *   `R1`: Destination register
        *   `(R2)`: Register indirect addressing using R2. Parentheses often denote "contents of memory location pointed to by".
        *   **Meaning:** Fetch the **operand from the memory address stored in register R2** and load it into register `R1`.
    *   **More Flexible:** Allows accessing data in memory whose address is dynamically calculated or stored in a register.

*   **Indexed Addressing Mode:**
    *   **Operand Location:** The operand's **memory address is calculated** by **adding a constant index (offset)** to the **contents of a register** (index register).
    *   **Example:** `MOV R1, [R2 + 5]`
        *   `MOV`: Instruction
        *   `R1`: Destination register
        *   `[R2 + 5]`: Indexed addressing. `R2` is the base register, `5` is the index/offset. Square brackets often indicate memory address.
        *   **Meaning:** Calculate the memory address by adding `5` to the value in register `R2`. Fetch the operand from this calculated memory address and load it into `R1`.
    *   **Useful for Arrays:** Efficiently accessing elements of arrays or data structures where elements are located at regular intervals in memory.

*   **Base-Register Addressing Mode:**
    *   **Operand Location:** Similar to indexed addressing, but the **offset** is also stored in a **register** (base register), rather than being a constant in the instruction. Sometimes the "offset" register is called the index register and the "base" register is called the base register. Terminology can vary.
    *   **Example:** `MOV R1, [R2 + offset]` (Assume `offset` is a register)
        *   `MOV`: Instruction
        *   `R1`: Destination register
        *   `[R2 + offset]`: Base-register addressing. `R2` is the base register, `offset` is the offset register.
        *   **Meaning:** Calculate the memory address by adding the **contents of register `offset`** to the **contents of register `R2`**. Fetch the operand from this calculated address and load it into `R1`.
    *   **Even More Flexible:**  Both the base address and the offset can be dynamically changed during program execution, offering greater flexibility in accessing memory locations.

**2. Memory Addressing Modes:**

These modes are specifically designed to access operands located in main memory.

*   **Direct Addressing Mode:**
    *   **Operand Location:** The **memory address of the operand is directly given in the instruction.**
    *   **Example:** `MOV R1, [1000]`
        *   `MOV`: Instruction
        *   `R1`: Destination register
        *   `[1000]`: Direct memory address `1000`.
        *   **Meaning:** Fetch the operand from **memory location 1000** and load it into `R1`.
    *   **Simple and Direct:** Straightforward way to access a specific memory location.
    *   **Address Fixed at Compile Time:** The memory address is fixed in the instruction and cannot be changed during runtime.

*   **Indirect Addressing Mode (Memory Indirect):**
    *   **Operand Location:** The instruction specifies a **memory location** that **contains the *address*** of the actual operand.  It's a level of indirection.
    *   **Example:** `MOV R1, [[2000]]` (Double square brackets often indicate memory indirect addressing)
        *   `MOV`: Instruction
        *   `R1`: Destination register
        *   `[[2000]]`: Memory indirect addressing. `2000` is the address of a memory location that *contains* the address of the operand.
        *   **Meaning:**
            1.  Go to **memory location 2000**.
            2.  Read the **value stored at 2000**.  Assume this value is a memory address (e.g., 3000).
            3.  Go to **memory address 3000**.
            4.  Fetch the **operand from memory location 3000** and load it into `R1`.
    *   **Very Flexible:** Allows accessing data whose address is stored in memory and can be changed dynamically.

*   **Absolute Addressing Mode:**
    *   **Operand Location:** Similar to direct addressing, the **memory address of the operand is directly specified in the instruction.**  "Absolute" is often used to distinguish it from relative addressing (see stack modes). In many contexts, "direct" and "absolute" addressing can be used interchangeably.
    *   **Example:** `MOV R1, 0x2000` (Using hexadecimal address)
        *   `MOV`: Instruction
        *   `R1`: Destination register
        *   `0x2000`: Absolute memory address `0x2000` (hexadecimal).
        *   **Meaning:** Fetch the operand from **memory address 0x2000** and load it into `R1`.

*   **Memory-Mapped I/O Addressing Mode:**
    *   **Operand Location:** A specific **memory address is mapped to an I/O device.** Accessing that memory address actually communicates with the I/O device instead of accessing RAM memory.
    *   **Example:** `MOV R1, [I/O Port]` (Assume `I/O Port` is a symbolic name for a memory address mapped to an I/O port)
        *   `MOV`: Instruction
        *   `R1`: Destination register
        *   `[I/O Port]`: Memory address representing an I/O port.
        *   **Meaning:** Read the value from the **memory-mapped I/O port** (which is actually reading from the I/O device connected to that port) and load it into `R1`.
    *   **Unified Address Space:**  Treats I/O devices as if they were memory locations, simplifying addressing.

**3. Stack Addressing Modes:**

These modes are relevant in stack-based architectures or when using stacks in register-based architectures.

*   **Stack Addressing Mode:**
    *   **Operand Location:** The **operand is implicitly located at the top of the stack (TOS).** Instructions operate on the TOS without explicitly specifying an address.
    *   **Example:** `POP R1`
        *   `POP`: Instruction (Pop from stack)
        *   `R1`: Destination register
        *   **Meaning:** Pop the **top value from the stack** and load it into register `R1`.  The operand's "address" is implicitly the top of the stack.

*   **Relative Addressing Mode:**
    *   **Operand Location:** Used for **branch instructions** (jumps). The **target address of the branch is calculated** by **adding an offset** to the **Program Counter (PC)**.
    *   **Example:** `BEQ 100`  (Branch if Equal to Zero, relative offset 100)
        *   `BEQ`: Instruction (Branch if Equal to Zero)
        *   `100`: Relative offset (e.g., in bytes or words)
        *   **Meaning:** If the zero condition is met, branch to the address calculated as **PC + 100**. The `100` is not an absolute address, but an offset *relative* to the current PC.
    *   **Position-Independent Code:** Relative addressing is useful for creating position-independent code (code that can be loaded and run at any memory address without modification).

**In Summary:**

Addressing modes are fundamental to how CPUs access data. They provide different levels of indirection, flexibility, and efficiency in operand access. Data addressing modes are fast and register-based, while memory addressing modes allow access to larger memory spaces with varying levels of indirection. Stack addressing modes are specialized for stack-based operations. Understanding addressing modes is essential for writing efficient assembly code, understanding compiler behavior, and comprehending the architecture of different processors.