module IP(
	input clk, reset, init,
	output reg fIp,
  input [63:0] plaintext,
  output reg [31:0] permuted_left,
  output reg [31:0] permuted_right
);
	reg [63:0] data;
	
//	always @(posedge init)
//		fIp <= 1'b0;
		
	always @(posedge clk) begin
	
		if(init) begin
			data <= { plaintext[6], plaintext[14], plaintext[22], plaintext[30], plaintext[38], plaintext[46], plaintext[54], plaintext[62],
						plaintext[4], plaintext[12], plaintext[20], plaintext[28], plaintext[36], plaintext[44], plaintext[52], plaintext[60],
						plaintext[2], plaintext[10], plaintext[18], plaintext[26], plaintext[34], plaintext[42], plaintext[50], plaintext[58],
						plaintext[0], plaintext[8], plaintext[16], plaintext[24], plaintext[32], plaintext[40], plaintext[48], plaintext[56],
						plaintext[7], plaintext[15], plaintext[23], plaintext[31], plaintext[39], plaintext[47], plaintext[55], plaintext[63],
						plaintext[5], plaintext[13], plaintext[21], plaintext[29], plaintext[37], plaintext[45], plaintext[53], plaintext[61],
						plaintext[3], plaintext[11], plaintext[19], plaintext[27], plaintext[35], plaintext[43], plaintext[51], plaintext[59],
						plaintext[1], plaintext[9], plaintext[17], plaintext[25], plaintext[33], plaintext[41], plaintext[49], plaintext[57] };
			permuted_left <= data[63:32];
			permuted_right <= data[31:0];
			fIp <= 1'b1;
		end else begin
			fIp <= 1'b0;
		end
	end

endmodule
