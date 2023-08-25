module SP(
  input [0:31] in,
  output [31:0] out
);
	assign out = {
				in[15], in[6],  in[19], in[20], in[28],  in[11], in[27], in[16],
				in[0],  in[14],  in[22], in[25], in[4], in[17], in[30],  in[9],
				in[1],  in[7], in[23], in[13],  in[31], in[26], in[2], in[8],
				in[18], in[12], in[29], in[5], in[21], in[10], in[3],  in[24]
			};
//	always @(posedge clk) begin
//		if(iSp) begin
//			out <= {
//				in[24], in[3],  in[10], in[21], in[5],  in[29], in[12], in[18],
//				in[8],  in[2],  in[26], in[31], in[13], in[23], in[7],  in[1],
//				in[9],  in[30], in[17], in[4],  in[25], in[22], in[14], in[0],
//				in[16], in[27], in[11], in[28], in[20], in[19], in[6],  in[15]
//			};
//			fSp <= 1'b1;
//		end else begin
//			fSp <= 1'b0;
//		end
//	end

endmodule
