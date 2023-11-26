module FILTER(
   input clk,
   input xorOut,
   input reset,
   output reg carry,
   output reg borrow
   
);

   parameter K = 8;
   reg [K-1:0] up;
   reg [K-1:0] down;
   

   always@ (posedge clk) begin
      if(reset) begin
         up <= 0;
         down <= 7;
         carry <= 0;
         borrow <= 1;
      end
 
      if(xorOut) begin     //down and borrow
         down <= down + 1;
         borrow <= 0;

         if(down == 8'b10000000) begin
            borrow <= 1;
         end
         else if(down >= 8'b11111111) begin
            down <= 0;
         end
         
         
      end
      else begin
            borrow <= 1;
      end
      
      
      if(!xorOut) begin   
         up <= up + 1;
         carry <= 0;
         if(up == 8'b10000000) begin
            carry <= 1;
         end
         else if(up >= 8'b11111111) begin
            u
         end
      end
      else begin
            carry <= 0;
      end
      
    
   end

endmodule

