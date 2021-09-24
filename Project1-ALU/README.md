# ECE550_ALU
## Author: 
Mila Zhao(bz82) and Xianming Luo(xl369)
## Design Implementation: 
### Adder
We used 32-bit CSA as the adder. In order to switch between SUM and SUB instructions, we used a mux to choose from B and B'. Also, we set carry-in of the adder to 1 when running SUB instruction. For the CSA, we built it with 3 16-bit RCAs. As to the full adder, we used a 3-input OR gate. This reduces the gate delay of our full adder so that our adder is able to work with a 50MHz clock. Our worst delay is about 15ns, which is less than 20ns, the period of the 50 MHz clock.\
### Bitwise And/Or
For the 32-bit bitwise and/or, we generate 32 and/or gates, each takes a single bit from A and B.\
### Barrel Shifter
For the barrel_shifter, we implement it with 1-bit 2:1 mux. We generalize the hardware implementation into two layers of GENERATE LOOPs. 
Also, for left and right shift, we use seperate shifter, with a 32-bit 2:1 mux to select result according to operation code.\
### isNotEqual
For the isNotEqual signal, we implement a or gate which takes all the bits of result of subtract operation as inputs.\
### isLessThan
For the isLessThan signal, we can easily find that it is related to the sign bit of the result of subtract operation. 
However, there is more we should consider about. When the ALU comes across overflow, the sign bit is just the opposite of the real sign. 
So that we implemented a 1-bit 2:1 mux to select from sign and notSign according to overflow signal.\

## Source Structure
.
├── alu.v
│	├── barrel_shifter.v			#32-bit barrel_shifter
│	│	├── mux_2to1_1b.v   		#1-bit 2:1 mux
│	├── csa_32b_by_rca.v			#32-bit Carry Select Adder made by 16bit Ripple Carry Adder
│	│	├── rca_16b.v 				#16-bit Ripple Carry Adder made by 4bit Ripplpe Carry Adder
│	│		├── rca_4b.v			#4-bit Ripple Carry Adder made by full adder
│	│			├── full_adder.v 	#1-bit full adder		
│	├── bitwise_and_32b.v			#32-bit bitwise and 
│	├── bitwise_or_32b.v			#32-bit bitwise or
│	├── mux_8to1_32b.v				#32-bit 8:1 mux
│		├── mux_4to1_32b.v 			#32-bit 4:1 mux
│			├── mux_2to1_32b.v 		#32-bit 2:1 mux
└── ...


