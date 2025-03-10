`timescale 1ns / 1ps

// PWM (Pulse Width Modulation) Module
module pwm(
    input clk,   // Clock signal
    input rst,   // Reset signal
    output reg dout // PWM output signal
);

parameter period = 20;  // Define the total period of the PWM cycle
integer count = 0;      // Counter variable to track the current cycle count
integer ton   = 0;      // Time duration for which the output is high
reg ncyc      = 1'b0;   // Flag to indicate a new cycle

// Always block triggered on the rising edge of the clock
always@(posedge clk)
begin
    if(rst == 1'b1)  // Reset condition
    begin
        count <= 0;
        ton   <= 0;
        ncyc  <= 1'b0;
    end   
    else 
    begin
        if(count <= ton)  // If within the ON duration, set output high
        begin
            count <= count + 1;
            dout  <= 1'b1;
            ncyc  <= 1'b0;
        end
        else if (count < period)  // If within the OFF duration, set output low
        begin
            count <= count + 1;
            dout  <= 1'b0;
            ncyc  <= 1'b0;
        end
        else  // If the full cycle is completed, reset count and indicate a new cycle
        begin
            ncyc  <= 1'b1;
            count <= 0;
        end
    end
end

// Always block to adjust the ON time dynamically
always@(posedge clk)
begin
    if(rst == 1'b0) 
    begin 
        if(ncyc == 1'b1) // When a new cycle starts, adjust the ON time
        begin
            if(ton < period)
                ton <= ton + 5;  // Increase ON time to modulate duty cycle
            else
                ton <= 0;  // Reset ON time when it reaches the period
        end
    end   
end

endmodule
