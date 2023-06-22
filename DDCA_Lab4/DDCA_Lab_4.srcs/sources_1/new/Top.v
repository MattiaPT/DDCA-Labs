`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lipowsky, Belt, Taiana
// 
// Create Date: 03/29/2023 04:56:41 PM
// 
//////////////////////////////////////////////////////////////////////////////////


module Top(
    input reset,
    input left,
    input right,
    
    input clk,
    
    output reg [5:0] lights
);
    
    wire clk_trans;
    reg [5:0] state_p;
    wire [5:0] state_n;
    
    reg [24:0] transition_count;
    reg [3:0] transition_state;
    reg [4:0] lights_en;
   
    Ford_Thunderbird ford (left, right, state_p, state_n);
    always @ (posedge clk or posedge reset)
    begin
    if (reset)
    begin
        state_p = 6'b000000;
        transition_count <= 0;
        lights_en <= 0;
        lights <= 0;
    end
    else if (clk)
    begin
        transition_count <= transition_count + 1;
        lights_en <= lights_en + 1;
        if (transition_state == 4'b0000 && &transition_count[20:0])
            transition_state = 4'b1000;
        else if (transition_state == 4'b1000 && &transition_count[20:0])
            transition_state = 4'b0100;
        else if (transition_state == 4'b0100 && &transition_count[20:0])
            transition_state = 4'b1100;
        else if (transition_state == 4'b1100 && &transition_count[20:0])
            transition_state = 4'b0010;
        else if (transition_state == 4'b0010 && &transition_count[20:0])
            transition_state = 4'b1010;
        else if (transition_state == 4'b1010 && &transition_count[20:0])
            transition_state = 4'b0110;
        else if (transition_state == 4'b0110 && &transition_count[20:0])
            transition_state = 4'b1110;
        else if (transition_state == 4'b1110 && &transition_count[20:0])
            transition_state = 4'b0001;
        else if (transition_state == 4'b0001 && &transition_count[20:0])
            transition_state = 4'b1001;
        else if (transition_state == 4'b1001 && &transition_count[20:0])
            transition_state = 4'b0101;
        else if (transition_state == 4'b0101 && &transition_count[20:0])
            transition_state = 4'b1101;
        else if (transition_state == 4'b1101 && &transition_count[20:0])
            transition_state = 4'b0011;
        else if (transition_state == 4'b0011 && &transition_count[20:0])
            transition_state = 4'b1011;
        else if (transition_state == 4'b1011 && &transition_count[20:0])
            transition_state = 4'b0111;
        else if (transition_state == 4'b0111 & &transition_count[20:0])
            transition_state = 4'b1111;
        else if (&transition_count)
            transition_state = 4'b0000;
        

        if (&transition_count)
            state_p = state_n;
        
        if (state_p[0] == 1)
        begin
            if (&lights_en && transition_state == 4'b0000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en) && transition_state == 4'b1000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en || lights_en == 4'b0001) && transition_state == 4'b0100)
                lights = state_p;
            else if (&lights_en[1:0] && transition_state == 4'b1100)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en) && transition_state == 4'b0010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] ) && transition_state == 4'b1010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] || lights_en == 4'b1010) && transition_state == 4'b0110)
                lights = state_p;
            else if (lights_en[3] && transition_state == 4'b1110)
                lights = state_p;
            else if ((lights_en[3] || ~|lights_en) && transition_state == 4'b0001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0]) && transition_state == 4'b1001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0] || ~|lights_en[3:0]) && transition_state == 4'b0101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0]) && transition_state == 4'b1101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0] || ~|lights_en) && transition_state == 4'b0011)
                lights = state_p;
            else if (~&lights_en[2:0] && transition_state == 4'b1011)
                lights = state_p;
            else if (~&lights_en && transition_state == 4'b0111)
                lights = state_p;
            else if (transition_state == 4'b1111)
                lights = state_p;
            else
                lights = 6'b000110;
         end
         
        else if (state_p[1] == 1)
        begin
            if (&lights_en && transition_state == 4'b0000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en) && transition_state == 4'b1000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en || lights_en == 4'b0001) && transition_state == 4'b0100)
                lights = state_p;
            else if (&lights_en[1:0] && transition_state == 4'b1100)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en) && transition_state == 4'b0010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] ) && transition_state == 4'b1010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] || lights_en == 4'b1010) && transition_state == 4'b0110)
                lights = state_p;
            else if (lights_en[3] && transition_state == 4'b1110)
                lights = state_p;
            else if ((lights_en[3] || ~|lights_en) && transition_state == 4'b0001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0]) && transition_state == 4'b1001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0] || ~|lights_en[3:0]) && transition_state == 4'b0101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0]) && transition_state == 4'b1101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0] || ~|lights_en) && transition_state == 4'b0011)
                lights = state_p;
            else if (~&lights_en[2:0] && transition_state == 4'b1011)
                lights = state_p;
            else if (~&lights_en && transition_state == 4'b0111)
                lights = state_p;
            else if (transition_state == 4'b1111)
                lights = state_p;
            else
                lights = 6'b000100;
         end
         
         else if (state_p[2] == 1)
        begin
            if (&lights_en && transition_state == 4'b0000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en) && transition_state == 4'b1000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en || lights_en == 4'b0001) && transition_state == 4'b0100)
                lights = state_p;
            else if (&lights_en[1:0] && transition_state == 4'b1100)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en) && transition_state == 4'b0010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] ) && transition_state == 4'b1010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] || lights_en == 4'b1010) && transition_state == 4'b0110)
                lights = state_p;
            else if (lights_en[3] && transition_state == 4'b1110)
                lights = state_p;
            else if ((lights_en[3] || ~|lights_en) && transition_state == 4'b0001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0]) && transition_state == 4'b1001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0] || ~|lights_en[3:0]) && transition_state == 4'b0101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0]) && transition_state == 4'b1101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0] || ~|lights_en) && transition_state == 4'b0011)
                lights = state_p;
            else if (~&lights_en[2:0] && transition_state == 4'b1011)
                lights = state_p;
            else if (~&lights_en && transition_state == 4'b0111)
                lights = state_p;
            else if (transition_state == 4'b1111)
                lights = state_p;
            else
                lights = 0;
         end
        else if (state_p[5] == 1)
        begin
            if (&lights_en && transition_state == 4'b0000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en) && transition_state == 4'b1000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en || lights_en == 4'b0001) && transition_state == 4'b0100)
                lights = state_p;
            else if (&lights_en[1:0] && transition_state == 4'b1100)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en) && transition_state == 4'b0010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] ) && transition_state == 4'b1010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] || lights_en == 4'b1010) && transition_state == 4'b0110)
                lights = state_p;
            else if (lights_en[3] && transition_state == 4'b1110)
                lights = state_p;
            else if ((lights_en[3] || ~|lights_en) && transition_state == 4'b0001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0]) && transition_state == 4'b1001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0] || ~|lights_en[3:0]) && transition_state == 4'b0101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0]) && transition_state == 4'b1101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0] || ~|lights_en) && transition_state == 4'b0011)
                lights = state_p;
            else if (~&lights_en[2:0] && transition_state == 4'b1011)
                lights = state_p;
            else if (~&lights_en && transition_state == 4'b0111)
                lights = state_p;
            else if (transition_state == 4'b1111)
                lights = state_p;
            else
                lights = 6'b011000;
         end
            
        else if (state_p[4] == 1)
        begin
            if (&lights_en && transition_state == 4'b0000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en) && transition_state == 4'b1000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en || lights_en == 4'b0001) && transition_state == 4'b0100)
                lights = state_p;
            else if (&lights_en[1:0] && transition_state == 4'b1100)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en) && transition_state == 4'b0010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] ) && transition_state == 4'b1010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] || lights_en == 4'b1010) && transition_state == 4'b0110)
                lights = state_p;
            else if (lights_en[3] && transition_state == 4'b1110)
                lights = state_p;
            else if ((lights_en[3] || ~|lights_en) && transition_state == 4'b0001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0]) && transition_state == 4'b1001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0] || ~|lights_en[3:0]) && transition_state == 4'b0101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0]) && transition_state == 4'b1101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0] || ~|lights_en) && transition_state == 4'b0011)
                lights = state_p;
            else if (~&lights_en[2:0] && transition_state == 4'b1011)
                lights = state_p;
            else if (~&lights_en && transition_state == 4'b0111)
                lights = state_p;
            else if (transition_state == 4'b1111)
                lights = state_p;
            else
                lights = 6'b001000;
         end
         
        else if (state_p[3] == 1)
        begin
            if (&lights_en && transition_state == 4'b0000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en) && transition_state == 4'b1000)
                lights = state_p;
            else if ((&lights_en || ~|lights_en || lights_en == 4'b0001) && transition_state == 4'b0100)
                lights = state_p;
            else if (&lights_en[1:0] && transition_state == 4'b1100)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en) && transition_state == 4'b0010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] ) && transition_state == 4'b1010)
                lights = state_p;
            else if ((&lights_en[1:0] || ~|lights_en[2:0] || lights_en == 4'b1010) && transition_state == 4'b0110)
                lights = state_p;
            else if (lights_en[3] && transition_state == 4'b1110)
                lights = state_p;
            else if ((lights_en[3] || ~|lights_en) && transition_state == 4'b0001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0]) && transition_state == 4'b1001)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[2:0] || ~|lights_en[3:0]) && transition_state == 4'b0101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0]) && transition_state == 4'b1101)
                lights = state_p;
            else if ((lights_en[3] || &lights_en[1:0] || ~|lights_en) && transition_state == 4'b0011)
                lights = state_p;
            else if (~&lights_en[2:0] && transition_state == 4'b1011)
                lights = state_p;
            else if (~&lights_en && transition_state == 4'b0111)
                lights = state_p;
            else if (transition_state == 4'b1111)
                lights = state_p;
            else
                lights = 0;
         end
         
         else 
         lights = 0;
    end
    end    
endmodule
