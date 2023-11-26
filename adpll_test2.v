module adpll_test2;
     reg clk;
     reg reset;
     reg ref_signal;
     reg feedback_signal;

     wire out;
     wire carry;
     wire borrow;

     
     initial begin
         clk = 1'b0;
         reset = 1'b1;
         #40
         reset = 1'b0;
         
         repeat (10) begin
             #300
             ref_signal = 1;
             #300
             feedback_signal = 1;
             #300
             ref_signal = 0;
             #300
             feedback_signal = 0;
             
             
         end

     end


     always begin
     #5 clk = ~clk;  //200Mhz Clock
     end
     
//adpll instantiation
XORDETECTOR xordetector(.ref_signal(ref_signal), .dco_signal(feedback_signal), .out(out));
FILTER filter(.clk(clk), .reset(reset), .xorOut(out), .carry(carry), .borrow(borrow));

endmodule