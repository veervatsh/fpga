module logic_gates_tb;
    logic [1:0] a;
    logic [1:0] b;
    logic [1:0] sel;
    logic [1:0] y;

    logic_gates uut (
        .a(a),
        .b(b),
        .y(y),
        .sel(sel)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, logic_gates_tb);

        $monitor("sel=%b a=%b b=%b y=%b", sel, a, b, y);
        
        for (int i = 0; i < 64; ++i) begin 
            {sel, a, b} = i;
            #10;
        end




//first attempt
        /*for(int i = 0; i<4; ++i) begin //loop through sel; traverse row
        sel=i;
            for (int j = 0; j < 16; j++) begin //loop through a b; traverse column; 2^4 cus 2 bits, two variables
                {a,b}=j;
                #10;
            end

        end*/



        /*sel = 00; //this in a nested for loop -> inner is 4, outer also 4; 2 bits
         a = 0;
         b = 0;
         #10;
         a = 0;
         b = 1;
         #10;
         a = 1;
         b = 0;
         #10;
         a = 1;
         b = 1;
         #10;

         sel = 01;
         a = 0;
         b = 0;
         #10;
         a = 0;
         b = 1;
         #10;
         a = 1;
         b = 0;
         #10;
         a = 1;
         b = 1;
         #10;

         sel = 10;
         a = 0;
         b = 0;
         #10;
         a = 0;
         b = 1;
         #10;
         a = 1;
         b = 0;
         #10;
         a = 1;
         b = 1;
         #10;

         sel = 11;
         a = 0;
         b = 0;
         #10;
         a = 0;
         b = 1;
         #10;
         a = 1;
         b = 0;
         #10;
         a = 1;
         b = 1;
         #10;*/

         $finish;


    end
endmodule