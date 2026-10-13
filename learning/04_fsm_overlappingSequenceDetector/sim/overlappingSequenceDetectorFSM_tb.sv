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

module overlappingSequenceDetector_tb;
logic clk;
logic reset;
logic x;
logic sequenceDetected;

logic test201,test202;

logic randomBit;
logic [3:0] bit_register;
//logic oldRegister[3:0];



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
    $dumpvars(0,overlappingSequenceDetector_tb);
    $monitor("clk=%b,reset=%b,x=%b,sequenceDetected=%b,bit_register=%b",clk,reset,x,sequenceDetected,bit_register);

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
        if(sequenceDetected == 1'b1) begin
             $display ("\nPASS TEST 1\n");
        end
        else begin
             $display ("\nFAIL TEST 1\n");
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
    if(sequenceDetected == 1'b1) begin
        $display ("\nPASS TEST 2.01\n");
        test201=1;
    end
    else begin
        $display ("\nFAIL TEST 2.01\n");
    end

    @(negedge clk);
    x=0;
    @(negedge clk);
    x=1;
    @(negedge clk);
    x=1;

    @(posedge clk);
    #0.1
    if(sequenceDetected == 1'b1) begin
        $display ("\nPASS TEST 2.02\n");
        test202=1;
    end
    else begin
        $display ("\nFAIL TEST 2.02\n");
    end
    //@(negedge clk);
    //x=0;

    @(posedge clk);
    #0.1
        if(test201 && test202 == 1) begin
             $display ("\nPASS TEST 2\n\n\n");
        end
        else begin
            $display ("\nFAIL TEST 2\n");
        end


/* [b0 b1 b2 b3] memory
 * [b1 b2 b3 x1]new bit; go to fsm is it sequence
 * [b2 b3 x1 x2] 
 * nested for loop? like ****
 *                       ***
                         **
                         *
 */
    @(posedge clk);
    //parameter 4bit_register = 4;
    #0.1
    reset = 1;

    /*moved to loop

    //randomBit = $urandom;

    //@(negedge clk);
    //x = randomBit;

    //bit_register= {bit_register[3:1],x};
    //oldest is bit 3, thats what falls off
    //bit_register = {bit_register[2:0],x}; 
    */
    //bit_register = 4'b0000;
    for (int i = 0; i < 10; i++) begin 
        @(posedge clk);
        #0.1
        randomBit = $urandom;
        @(negedge clk);
        reset = 0;
        x = randomBit;
        bit_register = {bit_register[2:0],x};


        if (bit_register == 4'b1011 && sequenceDetected == 1'b1) begin 
            $display ("\nSEQUENCE DETECTED\n\nPASS TEST 4\n");
        end
        else if (bit_register != 4'b1011 && sequenceDetected != 1'b1) begin 
            $display ("\nSEQUENCE NOT DETECTED\n\nPASS TEST 4\n");
        end
        else begin 
            $display ("\nSEQUENCE NOT DETECTED\n\FAIL TEST 4\n ");
        end
    end


    
    //if //do we need an if block? to check memory 
    $finish;
end

endmodule