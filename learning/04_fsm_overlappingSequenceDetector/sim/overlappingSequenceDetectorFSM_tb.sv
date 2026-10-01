//define signsls
//define dut
//create clock generator

/*send bit
 *  wait for clock edge
 *  set x 
 *  send to fsm
 */

/*initial block
 * iniitalize
 * asssert reset
 * directed tests
    sequence 1011

 * overlapping tests
 
 * random tests
 
 * setup for basys3
 finish*/
module testbench
logic clk;
logic reset;
logic x;
logic sequenceDetected;

overlappingSequenceDetectorFSM uut (
    .clk(clk),
    .reset(reset),
    .x(x),
    .sequenceDetected(sequenceDetected)
);


initial begin
    clk = 0;
end
always #10 clk = ~clk;


initial begin
    
end

endmodule