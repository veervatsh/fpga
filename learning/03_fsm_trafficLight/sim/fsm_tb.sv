module trafficLight_fsm_tb;
    logic clk;
    logic reset;
    logic [1:0] lightColor;

    trafficLight_fsm uut (
        .clk(clk),
        .reset(reset),
        .lightColor(lightColor)
    );

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0,trafficLight_fsm_tb);

        $monitor("clk = %b, reset = %b, lightColor = %b", clk, reset, lightColor);

        clk = 0;
        reset = 1;

        @(posedge clk);
        #10.1 reset = 0; //wait to prevent race conition

        for (int i = 0; i < 7; i++) begin 
            @(posedge clk); //next light color at edge
        end

        $finish;
    end
    always #10 clk = ~clk;
endmodule