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


Accessing registers
-------------------

Since the RP2040 is a von Neumann architecture, there exists one address space,
which can be accessed as a regular pointer in C:

```C
*(uint32_t *) (ADDRESS) = // ...some operation here.
```


Note that we first typecast the address as a `uint32_t *`, as it is a pointer to
a 32-bit register (remember that the RP2040 is a 32-bit MCU), which is then
dereferenced and operated on.

The address map of the RP2040 can be found in [page 24 of the datasheet].

From [vxj9800/bareMetalRP2040]:

> There are five common operations done on registers,
>
> 1. Set Value - Put all the bits of a register to a known state - 
>    `(uint32_t *) (REGISTER_ADDR) = regValue`
> 2. Set a bit - Make any bit of a register 1 -
>    `(uint32_t *) (REGISTER_ADDR) |= 1 << bitLocation`
> 3. Clear a bit - Make any bit of a register 0 -
>    `(uint32_t *) (REGISTER_ADDR) &= ~(1 << bitLocation)`
> 4. Flip a bit - Make any bit of a register flip, 0 -> 1 or 1 -> 0 - 
>    `(uint32_t *) (REGISTER_ADDR) ^= 1 << bitLocation`
> 5. Check a bit - Check if a register bit is 0 or 1 - 
>    `bool bitVal = ((uint32_t *) (REGISTER_ADDR)) & (1 << bitLocation)`
> 
> A register is shown to be accessed using `*(uint32_t *)` pointer casting 
> method in this section. There are two things to note here,
>
> 1. Use of `uint32_t` - The &micro;C used here is a 32-bit &micro;C. Meaning 
>    that all the registers in the &micro;C are 32-bit wide. Thus, a fixed length 
>    (32-bit wide) data type (`uint32_t`) is used to let the compiler know that 
>    the value being accessed is 32-bits in size.
> 2. A missing `volatile` keyword - Technically speaking, register accesses 
>    should always accompany `volatile` keyword, e.g.
>    `(volatile uint32_t *) (REGISTER_ADDR) |= 1 << bitLocation`. This keyword
>    lets the compiler know that the value stored at this address may change by 
>    means other than the code, i.e. the hardware itself can change its state. 
>    This prevents some optimizations from being applied at the compile time. 
>    The effect of this is discussed in Tutorial 1.

References
----------

- [Raspberry Pi Pico (RP2040) SRAM and Flash Programming](https://captdam.com/pico-program-storage/en)
- [8-bit vs. 32-bit MCU: Choosing the Right Microcontroller for Your PCB Design](https://resources.altium.com/p/8-bit-vs-32-bit-mcu-choosing-right-microcontroller-your-pcb-design)
- [vxj9800/bareMetalRP2040]

[page 24 of the datasheet]: https://datasheets.raspberrypi.com/rp2040/rp2040-datasheet.pdf#page=25
[vxj9800/bareMetalRP2040]: https://github.com/vxj9800/bareMetalRP2040
