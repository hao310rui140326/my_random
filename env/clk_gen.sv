`timescale 1ns/1ps 

module clk_gen(hclk_i,clk_tx_i,clk_rx_i);

localparam real CLKIN_FREQ     =  125.000   ; 
parameter PLL_REFCLK_IN_PERIOD = 1000 / CLKIN_FREQ;


`ifdef TDM
				localparam real CLKTX_FREQ     =  125.000   ; 
`elsif HDM
				localparam real CLKTX_FREQ     =  25.000   ; 
`else
				localparam real CLKTX_FREQ     =  2.500   ; 
`endif

				parameter PLL_REFCLK_TX_PERIOD = 1000 / CLKTX_FREQ;				
		
		



output   hclk_i,clk_tx_i,clk_rx_i   ;
reg      hclk_i,clk_tx_i,clk_rx_i   ;

initial begin
  hclk_i = 0;
  forever  #(PLL_REFCLK_IN_PERIOD/2)  hclk_i =~hclk_i ;  
end

initial begin
  clk_tx_i = 0;
  forever  #(PLL_REFCLK_TX_PERIOD/2)  clk_tx_i =~clk_tx_i ;  
end

initial begin
  clk_rx_i = 0;
  forever  #(PLL_REFCLK_TX_PERIOD/2)  clk_rx_i =~clk_rx_i ;  
end



endmodule




