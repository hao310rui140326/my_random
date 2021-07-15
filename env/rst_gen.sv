`timescale 1ns/1ps 

module rst_gen(/*AUTOARG*/
   // Outputs
   hreset_n
   );

output   hreset_n    ;
reg      hreset_n  ;

initial begin
  hreset_n = 1'b0 ;
  #1000
  hreset_n = 1'b1 ;  
end



endmodule


