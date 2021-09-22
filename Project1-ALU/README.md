# ECE550_ALU
### Author: 
Mila Zhao(bz82) and Xianming Luo(xl369)
### Design Implementation: 
We used 32-bit CSA as the adder. In order to switch between SUM and SUB instructions, we used a mux to choose from B and B'. Also, we set carry-in of the adder to 1 when running SUB instruction. For the CSA, we built it with 3 16-bit RCAs. As to the full adder, we used a 3-input OR gate. This reduces the gate delay of our full adder so that our adder is able to work with a 50MHz clock. Our worst delay is about 15ns, which is less than 20ns, the period of the 50 MHz clock.\
csa_32b_by_rca.v is the source code of 32-bit CSA, built with 3 16-bit RCAs.\
rca_16b.v is the source code of 16-bit RCA, built with 4 4-bit RCAs.\
rca_4b.v is the source code of 4-bit RCA, built with 4 1-bit FAs.\
full_adder.v is the source code of 1-bit FA.\
adder_tb.v is used as a test bench for the 32-bit CSA and alu_tb.v is used to test the entire function of our alu.