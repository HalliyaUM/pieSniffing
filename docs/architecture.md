Architecture of the RP2040
==========================

The RP2040 is a 32-bit MCU of the Von Neumann architecture. 

Note that the **bit-size of an MCU** refers to the size of data it can process at
any given time. An $n$-bit MCU has $n$-bit registers, $2^n$ memory addresses,
and the maximum integer it can comprehend is $2^n$.

That it is of the **von Neumann** architecture refers to its unified signal pathways
for data and instructions (control), as opposed to the Harvard architecture which
has separate pathways for such. It follows that the CPU sees a single memory
space, though it can then be segmented into regions with different attributes,
such as access control permissions, or whether certain regions can only be used
for data or instructions.

More precisely, the RP2040

- has a **Cortex M0+** CPU,
- supports the **Thumb** instruction set only,
- which has **2-byte-wide instructions**.

The following snippet informs the assembler of these facts:

```asm
.cpu cortex-m0plus
.thumb
.align 2
.thumb_func
```

References
----------

- [Raspberry Pi Pico (RP2040) SRAM and Flash Programming](https://captdam.com/pico-program-storage/en)
- [8-bit vs. 32-bit MCU: Choosing the Right Microcontroller for Your PCB Design](https://resources.altium.com/p/8-bit-vs-32-bit-mcu-choosing-right-microcontroller-your-pcb-design)
