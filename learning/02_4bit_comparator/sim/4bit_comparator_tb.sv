module comparator_tb;
    logic [3:0] a;
    logic [3:0] b;
    logic equal;
    logic greater;
    logic less;
    
    comparator uut (
        .a(a),
        .b(b),
        .equal(equal),
        .greater(greater),
        .less(less)
    );

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0, comparator_tb);

        $monitor("a=%b b=%b equal=%b greater=%b less=%b", a, b, equal, greater, less);

        for (int i = 0; i < 256; ++i) begin 
            {a,b} = i;
            #10;
        end
        $finish;
    end

endmodule