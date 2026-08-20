module logic_gates (
    input logic a,
    input logic b,
    input logic [1:0] sel,

    output logic y
);

always_comb begin
    case (sel)
       2'b00 : y = a & b;
       2'b01 : y = a | b;
       2'b10 : y = a ^ b;
       2'b11 : y = ~a;
    endcase
end
   
   endmodule
