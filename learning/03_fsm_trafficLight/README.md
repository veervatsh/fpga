# basic moore fsm
basic moore fsm that simulates a traffic light cycling through twice

## behavior
cyles through three states:
RED -> YELLOW -> GREEN

state changes on each rising edge of the clock. 

## state encoding
| STATE | ENCODING |
--------------------
| RED     | 2'b00  |
| YELLOW  | 2b'01  |
| GREEN   | 2b'01  |
____________________

## design
fsm:
- uses an enum to represet the states
- 'always comb' for next state and output logic
- 'always ff' for state register
- a synchronous reset

## simulation
testbench:
- generates a clock
- reset at startup
- releases reset after clock edge
- cycles the fsm
- generates a vcd waveform for graphical inspection
- generates bit output for numerical inspection

## tools
- systemverilog
- icarus verilog
- surfer