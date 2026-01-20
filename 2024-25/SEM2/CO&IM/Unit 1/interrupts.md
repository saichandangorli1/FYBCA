# Interrupts: Handling External Events

This section explains the concept of interrupts, a crucial mechanism for handling external events and improving the responsiveness of a computer system.

**What is an Interrupt?**

*   **Definition:** An interrupt is an **interruption of the normal sequence of execution** of a program by an external event or condition.
*   **Analogy:** Imagine you are reading a book (program execution). An interrupt is like someone knocking on your door. You pause reading, attend to the door (handle the interrupt), and then return to reading your book from where you left off.

**Why Use Interrupts?**

*   **Responsiveness to External Events:**  Interrupts allow the computer to respond promptly to events occurring outside the currently running program. These events could be:
    *   **Hardware Signals:**  Signals from peripheral devices (e.g., keyboard key press, mouse click, data arrival from network, disk drive operation complete).
    *   **Software Conditions:**  Special conditions detected by the operating system or running programs (e.g., error conditions, timer expiry).

*   **Efficiency:**  Instead of constantly checking for events (polling), the CPU can continue executing the current program and only be interrupted when an event *actually* occurs. This is more efficient than wasting CPU cycles on continuous polling.

**Interrupt Processing:**

When an interrupt occurs, the following generally happens:

1.  **Interrupt Signal:** An external device or software raises an **interrupt signal**. This signal is sent to the CPU via an **interrupt controller** (like a Programmable Interrupt Controller - PIC).

2.  **Interrupt Request (IRQ):** The CPU checks for interrupt signals at specific points in its execution cycle, typically **after completing each instruction**. If interrupts are **enabled**, the CPU acknowledges the interrupt signal.

3.  **Saving Context:** Before handling the interrupt, the CPU needs to **save the current execution context**. This is essential so that the interrupted program can be resumed correctly later. Context saving involves:
    *   **Saving the Program Counter (PC):**  The address of the next instruction to be executed in the *current* program is saved. This is crucial for resuming execution from the correct point.
    *   **Saving Registers:** The contents of important CPU registers (like accumulators, general-purpose registers, status flags) are also saved, as they represent the current state of the program.
    *   **Saving Context Location:** The saved context is typically pushed onto a **stack** in memory or stored in a designated area of memory.

4.  **Interrupt Service Routine (ISR) Execution:**
    *   The CPU needs to execute a special program called an **Interrupt Service Routine (ISR)** or **Interrupt Handler** to handle the specific interrupt.
    *   **Finding the ISR:** The CPU determines the starting address of the appropriate ISR. This can be done using:
        *   **Vector Table:** A table in memory that contains addresses of ISRs for different types of interrupts (vectored interrupts). The interrupt signal itself might provide a vector number to index into this table.
        *   **Fixed Address:** For simpler systems or non-vectored interrupts, there might be a fixed memory address where the ISR for all interrupts starts.

5.  **Restoring Context:** Once the ISR has completed its task (handling the interrupt), it needs to return control back to the interrupted program. Before returning:
    *   The CPU **restores the saved context** from the stack or memory. This involves:
        *   **Restoring the PC:**  The saved PC value is loaded back into the PC, so execution will resume at the correct instruction in the interrupted program.
        *   **Restoring Registers:**  The saved register values are loaded back into the CPU registers, restoring the program's state.

6.  **Resuming Program:** After restoring the context, the CPU **resumes execution of the interrupted program** from the point where it was interrupted (using the restored PC and register values).

**Interrupt Cycle (Adding to the Instruction Cycle):**

To accommodate interrupts, an **interrupt cycle** is added to the basic instruction cycle (fetch-execute). The instruction cycle now becomes:

 +---------+     +---------+     +-----------+
 | Fetch   | --> | Execute | --> | Interrupt | --> (Repeat)
 | Cycle   |     | Cycle   |     | Cycle     |
 +---------+     +---------+     +-----------+

 
**Diagram of Instruction Cycle with Interrupts (Figure 3.9 from Presentation):**

         Fetch cycle        Execute cycle        Interrupt cycle
    +-------------+    +-------------+    +-------------------+

    START --> | Fetch next | --> | Execute | --> | Check for | --> HALT (or Fetch)
| instruction | | instruction | | interrupt; |
+-------------+ +-------------+ | Process interrupt | (if interrupt pending)
^ | +-------------------+
| | ^
+-----------------+ |
Interrupts Interrupts No Interrupt
disabled enabled


*   **Fetch Cycle and Execute Cycle:**  As before.
*   **Interrupt Cycle:** After the execute cycle, the CPU checks if any interrupt signal is pending.
    *   **No Interrupt Pending:** If no interrupt is pending, the CPU proceeds to the next fetch cycle, continuing the normal program execution.
    *   **Interrupt Pending:** If an interrupt is pending:
        *   **Interrupts Disabled (during ISR):** Typically, interrupts are **disabled** while the CPU is executing an ISR. This is to prevent further interrupts from disrupting the handling of the current interrupt (unless nested interrupts are specifically enabled and handled).
        *   **Process Interrupt (ISR Execution):** The CPU jumps to the ISR, saves the context, executes the ISR code to handle the interrupt, and then restores the context and returns to the interrupted program.

**Multiple Interrupts:**

Two common approaches for dealing with multiple interrupts:

1.  **Disable Interrupts During ISR:**
    *   Simplest approach.
    *   When an interrupt is being processed (ISR is running), all other interrupts are **disabled** (ignored or kept pending).
    *   If another interrupt occurs while interrupts are disabled, it will typically **remain pending**.
    *   After the current ISR completes, interrupts are **re-enabled**. The CPU then checks if any interrupts are pending and handles them in sequence.

2.  **Priority Interrupts (Nested Interrupts):**
    *   More sophisticated approach.
    *   Interrupts are assigned **priority levels**.
    *   A higher-priority interrupt can *interrupt* the processing of a lower-priority interrupt.
    *   Requires more complex interrupt controller and context saving/restoring mechanisms.

**Workflow of Interrupts (Summary Steps from Presentation):**

1.  **Interrupt Generation:** Hardware or software raises an interrupt signal.
2.  **Interrupt Request (IRQ):** CPU checks for interrupt signals after each instruction. If enabled, acknowledges the signal.
3.  **Saving Context:** CPU saves current execution state (PC, registers, flags) to stack or memory.
4.  **ISR Execution:** CPU locates and executes the Interrupt Service Routine (ISR) using a Vector Table or Fixed Address.
5.  **Restoring Context:** After ISR completes, CPU restores saved execution state from the stack.
6.  **Resuming Program:** CPU resumes execution of the interrupted program.

**In Summary:**

Interrupts are a fundamental mechanism for making computer systems responsive to external events. They allow the CPU to handle asynchronous events efficiently without constant polling. The interrupt cycle, context saving, and interrupt service routines are key elements in the interrupt handling process. Understanding interrupts is crucial for understanding real-time systems, operating systems, and device driver interactions.
