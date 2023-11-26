module XORDETECTOR(
   input ref_signal,
   input dco_signal,
   output out

);

   assign out = ref_signal ^ dco_signal;

endmodule