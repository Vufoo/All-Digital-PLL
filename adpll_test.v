module adpll_test;
     reg clk;
     reg reset;
     reg ref_signal;
     reg feedback_signal;
     
     initial begin
         clk = 1'b0;
         reset = 1'b1;
         #40
         reset = 1'b0;
         
         repeat (10) begin
             ref_signal = 1;
             #255
             feedback_signal = 1;
             #255
             ref_signal = 0;
             #255
             feedback_signal = 0;
         end

     end


     always begin
     #5 clk = ~clk;  //200Mhz Clock
     end
     
//adpll instantiation
ADPLL adpll(.clk(clk), .reset(reset), .ref_signal(ref_signal), .feedback_signal(feedback_signal));

endmodule