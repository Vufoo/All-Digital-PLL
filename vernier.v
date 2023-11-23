module Vernier_TDC (
  input wire clk,
  input wire reset,
  input wire ref_signal,
  input wire feedback_signal,
  output reg [11:0] delay,
  output reg measurement_done
);

// Parameters
parameter COARSE_BITS = 8;
parameter FINE_BITS = 4;

// Internal signals
reg [COARSE_BITS-1:0] coarse_count;
reg [FINE_BITS-1:0] fine_count;
reg [1:0] compare_result;


always @(posedge clk) begin

  if (reset) begin
    coarse_count <= 0;
    fine_count <= 0;
    compare_result <= 2'b00;
    measurement_done <= 0;
    delay <= 0;
  end 

  else if (ref_signal != feedback_signal) begin
    compare_result <= (ref_signal < feedback_signal) ? 2'b01 : 2'b10;
    if(compare_result == 2 && (coarse_count < (2**COARSE_BITS - 1))) begin
      coarse_count <= coarse_count + 1;
      delay <= delay + 1;
    end
    if(compare_result == 1) begin
      coarse_count <= 0;
      delay <= 0;
      fine_count <= 0;
    end
  end 

  else if (ref_signal == feedback_signal && compare_result != 2'b00) begin
    compare_result <= 2'b00;
    measurement_done <= 1;
  end
  
  //else if (coarse_count < (2**COARSE_BITS - 1)) begin
    //coarse_count <= coarse_count + 1;
    //delay <= delay + 1;
  //end


  //if (ref_signal == 1 && feedback_signal == 1) begin
    
  //end
  else if (ref_signal != feedback_signal && compare_result != 2'b00) begin
    if (coarse_count == (2**COARSE_BITS - 1)) begin
      if (fine_count < (2**FINE_BITS - 1)) begin
        fine_count <= fine_count + 1;
      end else begin
        fine_count <= 0;
        delay <= delay + 1;
      end
    end
  end
  
  

end

//always @(posedge clk) begin
  
//end

endmodule