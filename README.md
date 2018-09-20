# cs2022-
Microcoded Instruction Set Processor 

MICROCODED INSTRUCTION SET PROCESSOR

Description:
The second project will implement a Microprogrammed Instruction Set Processor.
This builds on the VHDL model from the first project.
The following modifications are required:

 Increase the number of registers in the register-file from 8 to 9.

 This requires an additional select bit for the two multiplexers (Bus A and Bus
B) and the destination decoder. These are separate signals (TD, TA, TB) from
the Control Memory. See Figure 1. The size of the registers in the register-file
is 16 bits.

 Consequently all components of the Datapath (e.g. MUXs in the register-file,
decoder in the Register file, Arithmetic/logic Unit, Shifter and MUXs) are 16 bit
operations.

 Add and test Memory M (512 x 16) and Control Memorll (256 x 28) to your
project. MUX M will feed 16 bit addresses from ether the Bus A or the PC into
the Memory M entity but only the 9 least significant address bits will be used
to index into the array. This restricts the memory size to 512.

 Implement all the components shown in Figure 1 on page 3.

 Design reset logic for PC and CAR registers. This will enable you to start your
program.

 Write microprogramms for the Control Memory that implement the following
instructions:
o ADI, LD, SR, INC, NOT, ADD, unconditional jump, and conditional
branch (only one condition).

 Write machine code for the Memory M that demonstrates the use of the
following instructions:
o ADI, LD, SR, INC, NOT, ADD, unconditional jump, and conditional
branch (only one condition).

![](https://github.com/alexSilvaa/cs2022-/blob/master/1%20(1).png)

The Microprogmmmed Instruction Set Processor block diagram is shown in
Figure 1 on page 3. Figure 1 is taken from Figure 8-26 in Mano and Kime [2].
Alternatively the drawing may be obtained from Prentice Hall's website [1].
The Functional Unit should have the functionality defined in the Table 1 on
page 2.

![](https://github.com/alexSilvaa/cs2022-/blob/master/2%20(1).png)
