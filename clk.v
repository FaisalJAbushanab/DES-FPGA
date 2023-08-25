module clk(
	input inClock,
	output reg outClock,
	input clear    // active low clear
);
	
	//parameter IN_CLOCK  = (50000000)*10; // 50 MHz, multiply by 10
	parameter IN_CLOCK  = (50000000); 	// 50 MHz
	parameter OUT_CLOCK =  5; 				// 1 Hz

	parameter COUNT_MAX   = (IN_CLOCK / OUT_CLOCK)/2;  // Half period
	parameter CLOCK_WIDTH = $clog2(IN_CLOCK / OUT_CLOCK); 
	
	reg [CLOCK_WIDTH:0] counter;
	
	initial begin
		counter <=0;
		outClock <=0;
	end
	always @(posedge inClock)
//		if(clear == 1'b0) begin
//			counter <= 0;
//			outClock <= 0;
//		end
		begin
			if(counter == COUNT_MAX) begin
				outClock = ~outClock;
				counter <= 0;
			end
			else 
				counter <= counter + 1;
		end

endmodule