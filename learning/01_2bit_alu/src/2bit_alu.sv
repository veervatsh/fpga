module logic_gates (
    input logic [1:0] a,
    input logic [1:0] b,
    input logic [1:0] sel,

    output logic [1:0] y
);

always_comb begin
    case (sel)
       2'b00 : y = a + b;
       2'b01 : y = a - b;
       2'b10 : y = a & b;
       2'b11 : y = a ^ b;
    endcase
end
   
   endmodule
