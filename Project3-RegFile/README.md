# ECE550_RegFile
## Author: 
Mila Zhao(bz82) and Xianming Luo(xl369)
## Design Implementation: 
### Decoder
We made the 5 to 32 decoder using 32 5-input AND gates.
### 32-bit Single Register
We connect 32 D Flip-flops together, each represents one bit. Since their clock and reset is connected, they can be triggered and asynchronously cleared at the same time.

##Estimated Delay
Tested under the "Slow -7 1.5V 85 Model", the worst delay is about 17 ns, able to work under 50MHz clock.
## Source Structure
```
.
├── regfile.v						#32-bit regfile
│	├── decoder_5to32.v				#5to32 decoder
│	└── register_32b.v				#32-bit single register made by 1-bit D Flip-flop with enable
│		└── dffe_ref.v 				#1-bit D Flip-flop with enable
└── ...
```


