`timescale 1ns / 1ps

module rising_edge_detector(clk,rst,x,z);
input clk;
input rst;
input x;
output z;
reg [1:0] state, next_state;
parameter [1:0] A=2'b00,B=2'b01,C=2'b10;
always @* begin
    case(state)
        A:begin if(x==0)
            next_state = A;
            else
            next_state= B;
          end
       B:begin if(x==0)
            next_state= A;
            else
            next_state= C;
         end
       C:begin if(x==0)
            next_state= A;
            else
            next_state= C;
         end 
       default: next_state=A;           
     endcase   
end

always @(posedge clk or posedge rst)begin
    if(rst)
        state <=A;
    else
        state <= next_state;
end        
   
assign z= (rst!=1 && state==B);            
endmodule