module test_case();

class  packet;
	rand bit [31:0]  src,dst,data[];
	randc bit [7:0]  kind ;

	constraint s	{src >10;  src<15;} 
	constraint d	{dst >64;  dst<128;} 
	constraint ss	{soft src >15; soft  src<20;} 
	//constraint dlen {data.size inside {8,16} ; }
	constraint dlen {data.size inside {[8:16]} ; }
	constraint da    { foreach(data[i]) data[i] inside {[16:128]}; }

	function void display;
		$write("src=%4d,dst=%4d,kind=%4d,dlen=%4d,data=",src,dst,kind,data.size);		
		foreach(data[i]) begin
			$write(" %4d ",data[i]);		
		end
		$display;
	endfunction

endclass


packet p ;
initial begin
	p=new();
	p.randomize();
	p.display;

	p.constraint_mode(1);
	p.s.constraint_mode(0);
	p.randomize();
	p.display;

	p.constraint_mode(1);
	p.s.constraint_mode(0);
	p.randomize();
	p.display;

	#1000
	$finish ;	
end



endmodule



