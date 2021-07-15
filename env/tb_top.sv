`timescale 1ns/1ps 


module tb_top(/*AUTOARG*/
   // Outputs
   hreset_n, hclk_i, clk_tx_i, clk_rx_i
   );

/*AUTOINPUT*/
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			clk_rx_i;		// From u_clk_gen of clk_gen.v
output			clk_tx_i;		// From u_clk_gen of clk_gen.v
output			hclk_i;			// From u_clk_gen of clk_gen.v
output			hreset_n;		// From u_rst_gen of rst_gen.v
// End of automatics
/*AUTOWIRE*/



rst_gen u_rst_gen(/*AUTOINST*/
		  // Outputs
		  .hreset_n		(hreset_n));
clk_gen u_clk_gen(/*AUTOINST*/
		  // Outputs
		  .hclk_i		(hclk_i),
		  .clk_tx_i		(clk_tx_i),
		  .clk_rx_i		(clk_rx_i));
dump dump();
monitor monitor();
//forcelist forcelist();


test_case test_case();

endmodule


