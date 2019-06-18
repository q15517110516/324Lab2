# Lab #2: VHDL Components
## Problem 1
Develop a behavioral VHDL model for a 4-to-1word multiplexer (MUX). Your model should work with 8-bitwords. Develop a test bench for your MUX that demonstrates each function for all possible permutationsof inputs other than the 4 words. 
## Problem 2
(a)Develop  a behavioral  VHDL  model  for  a  4-bit  shift  register.  Your  shift  register  should  implement functions  for  LOAD,  HOLD,  RIGHT  SHIFT  and  LEFT  SHIFT.  In  addition  to  regular  inputs,  your  shift register should provide a SHIFT LEFT INPUT and a SHIFT RIGHT INPUT that input the value shifted into the right-most and left-most bits, respectively. You can multiplex a single port I_SHIFT_IN for the purpose of SHIFT LEFT INPUT and SHIFT RIGHT INPUT, as at most one is needed at a time. Your register should also  include  an  ENABLE  input  and  a  CLOCK  input. The LOAD,  HOLD, RIGHT  SHIFT  and  the  LEFT SHIFT  functions  should  be  rising-edge  trigged.Develop  a  test  bench  for  your  VHDL  shift  register  that demonstrates each function for all possible combinations of input signals of "I_SHIFT_IN", "sel", "clock", "enable", and at least two values of "I". shift_reg.vhdlis a sample shift_reg program that only declares the interface. A sample test bench that tests only two input cases is provided in the file shift_reg_tb.vhdl.

What to turn in:
* A  gate-level  RTL  circuit  schematic  design.  That  means  you  can  only  use  basic  gates  and  flip-flops in the design.You can use any diagram drawing software to illustrate the design, or you can hand-draw and submit a picture of the drawing.
* Implementation VHDL files and the test-bench for the top-level implementation.

(b) Use your 4-bit shift register from (a)to implement a structural VHDL model for an 8-bit shift register. This device should perform the same functions as the 4-bit shift register, but over 8 bits. Develop a test bench for  your  shift  register  that  demonstrates  each  function  for  all  possible  combinations  of  input  signals  of "I_SHIFT_IN", "shift", "clock", "enable", "load", and two values of "I".

What to turn in:
* A  gate-level  RTL  circuit  schematic  design.  That  means  you  can  only  use  basic  gates  and  flip-flops  in  the  design. However,  if  you  use the 4-bit  shift-register  in  3.a  unmodified,  you  can represent the 4-bit register as a blackbox.
* Implementation    VHDL    files    and    the    test-bench    for    the    top-level    implementation.
## Problem 3
Design and implement a 4-bit integer adder/subtracter. The inputs are signed, that means the most significant bit representsthe sign of number, 0 for positive and 1 for negative. The negative inputs are represented with two’s complement format. Theinputs of the components are two 4-bit signal vectors, and its outputs include a 4-bit signed signal vector for result, 1 bit carry(overflow)signal and 1 bit underflow signal. You may use any sequential or parallel digital algorithms for the add/substract operations.Note that you can NOTuse the “+” and “-“ operators provided by VHDL libraries in your implementation.

What to turnin:
* A  gate-level  RTL  circuit  schematic  design.  That  means  you  can  only  use  basic  gates  and  flip-flops in the design. 
* Implementation VHDL files and the test-bench for the top-level implementation.

## Use synthesizable features of VHDL(IMPORTANT)
You  should only use  the  synthesizable  features  of  VHDL. If  your  code  doesn’t  conform  to  the  following requirements, the score for that part of code will be zero. Note that the following requirements only apply to the implementation part. You can use ANY featuresin your test benches.

VHDL feature requirements:
* Novariables are allowed;
* Up to one "wait" statement OR a sensitivity list is allowed in a process. 
* A  process  should  wait  on  (using  a  “wait”  statement  or  the  sensitivity  list)  either  
  * ALL  signals appearing on the right-hand-side in the process body; or 
  * the clock signal or with the optional reset signal.
* No"wait for" statements or time expressions in signal assignment statements.
