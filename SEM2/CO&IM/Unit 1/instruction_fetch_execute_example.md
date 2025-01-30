# Example of Instruction Fetch and Execute

This section walks through a simplified example of program execution to illustrate the instruction fetch and execute cycle in more detail, based on Figure 3.5 and the hypothetical machine described in the presentation.

**Hypothetical Machine Characteristics (Figure 3.4):**

*   **Single Data Register:**  Accumulator (AC).
*   **16-bit Instructions and Data:** Memory is organized in 16-bit words.
*   **Instruction Format:**
    *   4-bit Opcode (Operation Code):  Specifies the type of operation.
    *   12-bit Address:  Specifies a memory address (if needed for the operation).
*   **Integer Format:** 16-bit magnitude (for data).
*   **Internal CPU Registers:**
    *   Program Counter (PC): Address of the instruction.
    *   Instruction Register (IR): Instruction being executed.
    *   Accumulator (AC): Temporary storage for data.
*   **Hypothetical Opcodes (Partial List):**
    *   `0001` (1 in hex): Load AC from memory
    *   `0010` (2 in hex): Store AC to memory
    *   `0101` (5 in hex): Add to AC from memory

**Example Program in Memory (Starting at Address 300):**

Let's assume the following program is loaded in memory starting at address 300 (all values in hexadecimal):

| Address | Memory Content (Hex) | Meaning                                  |
| :------ | :------------------- | :--------------------------------------- |
| 300     | `1940`               | **Load AC** from memory address `940`     |
| 301     | `5941`               | **Add** content of address `941` to AC  |
| 302     | `2941`               | **Store AC** to memory address `941`    |
| ...     | ...                  | ...                                      |
| 940     | `0003`               | Data value: 3                              |
| 941     | `0002`               | Data value: 2                              |
| ...     | ...                  | ...                                      |

**Step-by-Step Execution (Following Figure 3.5):**

**Step 1:**

*   **PC:** `300` (Points to the first instruction)
*   **Fetch:** Instruction at address `300` (`1940`) is fetched from memory and loaded into **IR**.
*   **PC Incremented:** PC becomes `301`.
*   **Registers:**
    *   PC = `300` -> `301`
    *   IR = `1940`
    *   AC = (Unchanged, represented as empty or `0000` initially)

**Step 2:**

*   **Execute Instruction:** `1940` in IR is decoded. Opcode `1` (first digit) means "Load AC". Address part `940` (remaining digits) specifies the memory location to load from.
*   **Action:**  Data at memory address `940` (`0003`) is fetched and loaded into **AC**.
*   **Registers:**
    *   PC = `301` (No change in this step)
    *   IR = `1940` (Instruction still in IR for reference)
    *   AC = `0003` (Loaded value 3)

**Step 3:**

*   **PC:** `301` (Points to the next instruction)
*   **Fetch:** Instruction at address `301` (`5941`) is fetched and loaded into **IR**.
*   **PC Incremented:** PC becomes `302`.
*   **Registers:**
    *   PC = `301` -> `302`
    *   IR = `5941`
    *   AC = `0003` (Value from previous step)

**Step 4:**

*   **Execute Instruction:** `5941` in IR is decoded. Opcode `5` (first digit) means "Add to AC". Address part `941` specifies the memory location to add from.
*   **Action:**  Data at memory address `941` (`0002`) is fetched. It is **added** to the current value in **AC** (`0003`). The **result** (`0005`) is stored back in **AC**.
*   **Registers:**
    *   PC = `302` (No change)
    *   IR = `5941`
    *   AC = `0005` (3 + 2 = 5)

**Step 5:**

*   **PC:** `302` (Points to the next instruction)
*   **Fetch:** Instruction at address `302` (`2941`) is fetched and loaded into **IR**.
    *   **PC Incremented:** PC becomes `303`.
*   **Registers:**
    *   PC = `302` -> `303`
    *   IR = `2941`
    *   AC = `0005` (Value from previous step)

**Step 6:**

*   **Execute Instruction:** `2941` in IR is decoded. Opcode `2` (first digit) means "Store AC to memory". Address part `941` specifies the memory location to store to.
*   **Action:** The value in **AC** (`0005`) is **stored** into memory address `941`.
*   **Memory Location 941 Updated:** The content of memory address `941` changes from `0002` to `0005`.
*   **Registers:**
    *   PC = `303` (No change)
    *   IR = `2941`
    *   AC = `0005` (Value remains in AC)

**Result:**

After these six steps, the program has effectively:

1.  Loaded the value `3` from memory address `940` into the Accumulator (AC).
2.  Added the value `2` from memory address `941` to the AC (result in AC is `5`).
3.  Stored the sum (`5`) back into memory address `941`.

This simple example demonstrates the basic fetch-execute cycle and how instructions are processed step-by-step to perform operations on data in memory using CPU registers.

**Important Notes from the Presentation:**

*   **MAR and MBR (Memory Address Register and Memory Buffer Register):** The presentation mentions that for simplicity, intermediate registers like MAR and MBR are ignored in this example. In a real system, these registers would be actively involved in the memory access process during fetch and execute cycles.
*   **Hexadecimal Notation:**  Using hexadecimal makes it easier to represent binary data and addresses in a more compact and readable form.

**In Summary:**

This step-by-step walkthrough illustrates the fundamental instruction fetch and execute cycle using a simple hypothetical machine and program. It highlights how the PC, IR, and AC registers work together to fetch instructions, decode them, and perform operations, ultimately leading to the execution of a program.
