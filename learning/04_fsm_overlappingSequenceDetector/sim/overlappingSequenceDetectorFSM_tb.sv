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

module overlappingSequenceDetector_tb
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
    reset = 1;
    x = 0;
end
always #10 clk = ~clk;
/*reset = 1;
x = 0;*/


initial begin
    $dumpfile ("waveform.vcd");
    $dumpvars(0,"overlappingSequenceDetector_tb");
    $monitor("clk=%b,reset=%b,x=%b,sequenceDetected=%b",clk,reset,x,sequenceDetected);

//fed
    @(posedge clk);
        reset = 1;//start at S0
    @(negedge clk);
        reset = 0; 
        x = 1; //observe
    @(negedge clk);
        x=0;
    @(negedge clk);
        x=1;
    @(negedge clk);
        x=1;

//print if test worked
    @(posedge clk);
    #0.1
        if(sequenceDetected == 1b'1) begin
             $display "PASS TEST 1";
        end
        else begin
            $display "FAIL TEST 1";
        end
        
    //@(negedge clk)
    //    #10.001 reset = 0;
//feed bits
    //reset = 1;
    //reset = 0;

//overlapping
    @(posedge clk);
    #10.1 reset =1;
    @(negedge clk);
    reset = 0;
    x=1;
    @(negedge clk);
    x=0;
    @(negedge clk);
    x=1;
    @(negedge clk);
    x=1; //start of overlap
        @(posedge clk);
        #0.1
        if(sequenceDetected == 1b'1) begin
             $display "PASS TEST 2.01";
        end
        else begin
            $display "FAIL TEST 2.01";
        end
    @(negedge clk);
    x=0;
    @(negedge clk);
    x=1;
    @(negedge clk);
    x=1;
        @(posedge clk);
        #0.1
        if(sequenceDetected == 1b'1) begin
             $display "PASS TEST 2.02";
        end
        else begin
            $display "FAIL TEST 2.02";
        end
    //@(negedge clk);
    //x=0;

    @(posedge clk);
    #0.1
        if(sequenceDetected == 1b'1) begin
             $display "PASS TEST 2";
        end
        else begin
            $display "FAIL TEST 2";
        end
    $finish
end

endmodule