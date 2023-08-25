module FP(
  input clk, iFp,
  output reg fFp,
  input [0:63] plaintext,
  output reg [63:0] permuted_text
);
	
//	always @(posedge iFp)
//		fFp <= 1'b0;
		
	always @(posedge clk) begin
		if(iFp == 1'b1) begin 
//			permuted_text <= { 
//						plaintext[24], plaintext[56], plaintext[16], plaintext[48], plaintext[8], plaintext[40], plaintext[0], plaintext[32],
//						plaintext[25], plaintext[57], plaintext[17], plaintext[49], plaintext[9], plaintext[41], plaintext[1], plaintext[33],
//						plaintext[26], plaintext[58], plaintext[18], plaintext[50], plaintext[10], plaintext[42], plaintext[2], plaintext[34],
//						plaintext[27], plaintext[59], plaintext[19], plaintext[51], plaintext[11], plaintext[43], plaintext[3], plaintext[35],
//						plaintext[28], plaintext[60], plaintext[20], plaintext[52], plaintext[13], plaintext[44], plaintext[4], plaintext[36],
//						plaintext[29], plaintext[61], plaintext[21], plaintext[53], plaintext[13], plaintext[45], plaintext[5], plaintext[37],
//						plaintext[30], plaintext[62], plaintext[22], plaintext[54], plaintext[14], plaintext[46], plaintext[6], plaintext[38],
//						plaintext[31], plaintext[63], plaintext[23], plaintext[55], plaintext[15], plaintext[47], plaintext[7], plaintext[39] };
			permuted_text <= {
						 plaintext[39],  plaintext[7], plaintext[47], plaintext[15],  plaintext[55], plaintext[23], plaintext[63], plaintext[31],
						 plaintext[38],  plaintext[6], plaintext[46], plaintext[14],  plaintext[54], plaintext[22], plaintext[62], plaintext[30],
						 plaintext[37],  plaintext[5], plaintext[45], plaintext[13],  plaintext[53], plaintext[21], plaintext[61], plaintext[29],
						 plaintext[36],  plaintext[4], plaintext[44], plaintext[12],  plaintext[52], plaintext[20], plaintext[60], plaintext[28],
						 plaintext[35],  plaintext[3], plaintext[43], plaintext[11],  plaintext[51], plaintext[19], plaintext[59], plaintext[27],
						 plaintext[34],  plaintext[2], plaintext[42], plaintext[10],  plaintext[50], plaintext[18], plaintext[58], plaintext[26],
						 plaintext[33],  plaintext[1], plaintext[41], plaintext[9],   plaintext[49], plaintext[17], plaintext[57], plaintext[25],
						 plaintext[32],  plaintext[0], plaintext[40], plaintext[8],   plaintext[48], plaintext[16], plaintext[56], plaintext[24]
			};
			fFp <= 1'b1;

		end else begin
			fFp <= 1'b0;
		end
	end

endmodule
