/*
* sequence detecotor fsm; overlapping; mealy machine
* inputs: clk, x
* outputs: sequenceDetected -> true
*/

module overlappingSequenceDetectorFSM(
    input logic clk,
    input logic x,
    input logic reset,
    
    output logic sequenceDetected
);

typedef enum bit [1:0] {
    S0 = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10,
    S3 = 2'b11
    
} stateValues;
stateValues nextState, currentState;

always_comb begin
    case (currentState)
    S0: begin
        if (x==1'b1) begin
            nextState = S1;
            sequenceDetected = 1'b0;
        end
        else begin
            nextState = S0;
            sequenceDetected = 1'b0;
        end
    end
    S1: begin
        if (x == 1'b0) begin
            nextState = S2;
            sequenceDetected = 1'b0;
        end
        else begin
            nextState = S1;
            sequenceDetected = 1'b0;
        end
    end
    S2: begin
        if(x==1'b1) begin
            nextState = S3;
            sequenceDetected = 1'b0;
        end
        else begin
            nextState = S0;
            sequenceDetected = 1'b0;
        end
    end
    S3: begin
        if(x== 1'b1) begin
            nextState = S1;
            sequenceDetected = 1'b1;
        end
        else begin
            nextState = S2;
            sequenceDetected = 1'b0;
        end
    end
    default: begin
        /*if (reset == 1'b1) begin
            nextState = S0;
            sequenceDetected = 1'b0;
        end*/

        nextState = S0;
        sequenceDetected = 1'b0;
    end
    endcase
end

always_ff @(posedge clk) begin
    if (reset == 1'b1) begin
        currentState <= S0;
    end
    else begin
        currentState <= nextState;
    end
end

endmodule