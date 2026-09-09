/*
* 4 bit comparator
* 2 inputs
* 3 outputs
*/

module comparator (
    input logic [3:0] a,
    input logic [3:0] b,

    output logic equal,
    output logic greater,
    output logic less
);

always_comb begin 
    if (a > b) begin 
        greater = 1;
        less = 0;
        equal = 0;
    end
    else if (a < b) begin 
        greater = 0;
        less = 1;
        equal = 0;
    end
    else  begin 
        greater = 0;
        less = 0;
        equal = 1;
    end
end

endmodule