/*
* traffic light fsm
* inputs: clk, reset
* outputs: red,yellow,green; use enums
*/

module trafficLight_fsm (
    input logic clk,
    input logic reset,
    output logic [1:0] lightColor
);

//change to enum
    typedef enum bit [1:0] {
        RED = 2'b00,
        YELLOW = 2'b01,
        GREEN = 2'b10
    } trafficLight;
    trafficLight nextState,currentState;

    //flag for if reset
    //typedef enum bit {
    //    false = 1'b0, 
    //    true = 1'b1} 
    //resetFlag

    //output logic [1:0] lightColor
    /*logic output red,
    logic output yellow,
    logic output green*/

//change state based on clock edge
always_comb begin 
    //previous state
    case (currentState) 
        RED: begin
            lightColor = 2'b00; 
            nextState = YELLOW;
        end 
        YELLOW: begin 
            lightColor = 2'b01;
            nextState = GREEN;
        end
        GREEN: begin 
            lightColor = 2'b10;
            nextState = RED;
        end
        default: begin 
            lightColor = 2'b00;
            nextState = RED;
        end
    endcase
end

//check if reset pressed; if true -> go to state S0
always_ff @(posedge clk) begin 
    if (reset == 1'b1) begin
        //resetFlag = true;
        //output red
        //lightColor = 2'b00;
        currentState <= RED;
    end
    else begin
        //next state
        currentState <= nextState;

    end
end

endmodule