module ADPLL(
   input clk,
   input reset,
   input ref_signal,
   
   output feedback_signal
   
);
   wire [11:0] delay;
   wire measurement_done;
   
   Vernier_TDC vernier_tdc (
      .clk(clk), 
      .reset(reset),
      .ref_signal(ref_signal),
      .feedback_signal(feedback_signal),
      .delay(delay),
      .measurement_done(measurement_done)
   );


endmodule

