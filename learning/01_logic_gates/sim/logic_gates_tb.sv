module logic_gates_tb;
    logic a;
    logic b;
    logic [1:0] sel;
    logic y;

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
        sel = 00;
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
         #10;

         $finish;


    end
endmodule