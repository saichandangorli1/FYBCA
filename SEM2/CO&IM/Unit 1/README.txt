# Unit 1: CPU Organization - Study Guide

This directory contains study notes and explanations for "Unit 1: CPU Organization" from a Computer Organization and Microprocessors course.

**Topics Covered:**

1.  [Introduction to CPU Organization](#introduction-to-cpu-organization)
2.  [Bus Organization of 8085 Microprocessor](#bus-organization-of-8085-microprocessor)
    *   [Address Bus](#address-bus)
    *   [Data Bus](#data-bus)
    *   [Control Bus](#control-bus)
    *   [Why Bus Organization?](#why-bus-organization)
3.  [Computer Components](#computer-components)
    *   [Hardware vs. Software Programming](#hardware-vs-software-programming)
    *   [CPU, Memory, I/O Modules](#cpu-memory-io-modules)
    *   [Registers (PC, IR, MAR, MBR, I/O AR, I/O BR)](#registers)
4.  [Computer Function - Instruction Cycle](#computer-function---instruction-cycle)
    *   [Instruction Fetch and Execute](#instruction-fetch-and-execute)
    *   [Example of Program Execution](#example-of-program-execution)
5.  [Interrupts](#interrupts)
    *   [Interrupt Cycle and Handling](#interrupt-cycle-and-handling)
    *   [Workflow of Interrupts](#workflow-of-interrupts)
    *   [Multiple Interrupts](#multiple-interrupts)
6.  [Stack-Based CPU Organization](#stack-based-cpu-organization)
    *   [Principles of Stack-Based CPUs](#principles-of-stack-based-cpus)
    *   [Stack Operations (PUSH, POP, ADD, LOAD, STORE)](#stack-operations)
    *   [Example: Addition on a Stack-Based CPU](#example-addition-on-stack-based-cpu)
7.  [Arithmetic and Logic Unit (ALU)](#arithmetic-and-logic-unit-alu)
    *   [Half Adder](#half-adder)
    *   [Full Adder](#full-adder)
    *   [1-bit and 4-bit ALU](#1-bit-and-4-bit-alu)
8.  [Addressing Modes](#addressing-modes)
    *   [Data Addressing Modes](#data-addressing-modes)
    *   [Memory Addressing Modes](#memory-addressing-modes)
    *   [Stack Addressing Modes](#stack-addressing-modes)

---

**Note:**  Each of the following files (2-8) will be placed in the same directory as `README.md`.

**2. `introduction_to_cpu_organization.md`**

```markdown
# Introduction to CPU Organization

This section provides an overview of CPU organization, setting the stage for understanding the more detailed topics in this unit.

**Key Concepts:**

*   **CPU (Central Processing Unit):** The brain of the computer, responsible for executing instructions and performing calculations.
*   **Organization:** Refers to the internal structure and functional units of the CPU and how they are interconnected and interact to perform their tasks.
*   **Microprocessor (like 8085):** A single integrated circuit that contains the entire CPU.

**Unit 1 Overview (From the Presentation):**

The presentation "UNIT 1 : CPU ORGANIZATION" by Prof. Shankar Mali will cover the following key aspects:

*   **Bus Organization:** How different components within a computer system communicate with each other, focusing on the 8085 microprocessor as an example.
*   **Computer Components:**  Understanding the fundamental building blocks of a computer system, including the CPU, memory, and input/output (I/O) modules.
*   **Computer Function:**  Explaining the basic steps involved in executing a program, including the instruction cycle.
*   **Interrupts:** How the CPU handles external events and interruptions to its normal program execution.
*   **Stack-Based CPU Organization:**  Exploring a different CPU architecture that utilizes a stack for operations.
*   **Arithmetic and Logic Unit (ALU):**  Delving into the component responsible for performing arithmetic and logical operations.
*   **Addressing Modes:**  Examining different ways the CPU can access data and instructions in memory.

**Why Study CPU Organization?**

Understanding CPU organization is crucial because it:

*   Provides a foundational knowledge of how computers work at a low level.
*   Helps in understanding performance bottlenecks and optimizing code.
*   Is essential for anyone working in computer architecture, embedded systems, operating systems, and related fields.
*   Gives insights into the evolution of computer technology and the principles behind modern processors.

This unit will start by exploring the bus organization of the 8085 microprocessor, a classic example for understanding fundamental CPU concepts.