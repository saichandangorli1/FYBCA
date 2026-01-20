# Address Bus in Details (8085 Microprocessor)

This section provides a more in-depth look at the Address Bus of the 8085 microprocessor.

**Key Characteristics:**

*   **Unidirectional:** As previously discussed, the address bus is *unidirectional*. Data (in this case, the address) flows in only one direction: **from the microprocessor (CPU) to the memory or I/O devices.**

    *   **Analogy:** Think of it like a one-way street leading *out* from the CPU to tell memory or peripherals *where* the CPU wants to go (which location it wants to access).

*   **Purpose:** The primary function of the address bus is to **specify the memory location or I/O device address** that the CPU intends to access. This could be for reading data from that location or writing data to it.

*   **Width:** The 8085 address bus is **16-bits wide**. This is a crucial factor that determines the **addressing capacity** of the microprocessor.

    *   **16 Bits = 2<sup>16</sup> Possible Addresses:** With 16 bits, the 8085 can represent 2<sup>16</sup> = 65,536 unique addresses.

    *   **Memory Addressing Capacity:** Since each address typically corresponds to a byte (8 bits) of memory, a 16-bit address bus allows the 8085 to address **64 Kilobytes (KB)** of memory (65,536 bytes = 64KB).

*   **Hexadecimal Representation:** Memory addresses are often represented in **hexadecimal (base-16)** for convenience because it's more compact than binary and easier to read for humans.

    *   **16-bit Address Range in Hex:**  A 16-bit address can range from `0000 H` to `FFFF H` in hexadecimal.
        *   `0000 H` is equivalent to 0000 0000 0000 0000 in binary.
        *   `FFFF H` is equivalent to 1111 1111 1111 1111 in binary.
        *   `H` at the end denotes hexadecimal notation.

    *   **Four Hexadecimal Digits:** Each hexadecimal digit represents 4 bits (since 16 = 2<sup>4</sup>). Therefore, a 16-bit address is represented by four hexadecimal digits.

**Length of Address Bus and Memory Capacity:**

*   **Address Bus Width = Memory Capacity:** The width of the address bus directly determines the maximum amount of memory a system can address.

    *   **Example: 32-bit Address Bus:** A system with a 32-bit address bus can address 2<sup>32</sup> memory locations.
        *   2<sup>32</sup> bytes = 4,294,967,296 bytes = 4 Gigabytes (GB).

*   **Theoretical vs. Practical Limit:** While a 16-bit address bus *theoretically* allows addressing 64KB, and a 32-bit bus allows 4GB, the *actual* amount of usable memory in a system can be less due to:

    *   **Chipset Limitations:** The chipset (supporting circuitry on the motherboard) might have limitations on the maximum addressable memory.
    *   **Motherboard Design:** The physical design and connections on the motherboard can also impose restrictions.
    *   **Operating System and Software:**  The operating system and software might also have limitations, although these are less common constraints for modern systems in terms of address space.

**In Summary:**

The address bus is the crucial pathway for the CPU to *locate* data and instructions in memory or to select I/O devices. Its unidirectional nature and 16-bit width in the 8085 define how memory addresses are specified and the total memory capacity the microprocessor can handle. Understanding the address bus is key to understanding memory organization and addressing in computer systems.