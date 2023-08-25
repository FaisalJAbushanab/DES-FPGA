module EB(
  input clk, iEx,
//  output reg fEx,
//  input clk, iEx,
  input [0:31] right,
  output reg [47:0] EPOut
);

//	assign EPOut = {
//				right[0],     right[31:27],
//				right[28:23], right[24:19], right[20:15],
//				right[16:11] ,right[12:7],  right[8:3],
//				right[4:0],   right[31]
//			};
	
//	assign EPOut = {
//				right[31],   right[0:4], right[3:8],
//				right[7:12], right[11:16], right[15:20],
//				right[19:24], right[23:28], right[27:31],
//				right[0]
//			};
	
		
	always @(posedge clk) begin
		if(iEx) begin
//			EPOut <= {
//				right[31],   right[0:4], right[3:8],
//				right[7:12], right[11:16], right[15:20],
//				right[19:24], right[23:28], right[27:31],
//				right[0]
//			};
			EPOut[0] <= right[0];
			EPOut[5:1] <= right[27:31];
			EPOut[11:6] <= right[23:28];
			EPOut[17:12] <= right[19:24];
			EPOut[23:18] <= right[15:20];
			EPOut[29:24] <= right[11:16];
			EPOut[35:30] <= right[7:12];
			EPOut[41:36] <= right[3:8];
			EPOut[46:42] <= right[0:4];
			EPOut[47] <= right[31];
		end 
	end
	
endmodule