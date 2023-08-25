module PD(
  input clk, init,
  output reg fPd,
  input wire [0:63] key,
  output reg [55:0] droppedKey
);
//	reg [55:0] data;
//	reg f;
//	assign droppedKey = data;
//	assign fInit = f;

//	always @(posedge init)
//		fPd <= 1'b0;
		
	always @(posedge clk) begin
//			data <= {key[62:56], key[54:48], key[46:40], key[38:32], key[30:24], key[22:16], key[14:8], key[6:0]};
		if (init) begin
//			droppedKey <= { 
//								 key[3],  key[11], key[19], key[27], key[4],  key[12], key[20], key[28], 
//								 key[36], key[44], key[52], key[60], key[5],  key[13], key[21], key[29],
//								 key[37], key[45], key[53], key[61], key[6],  key[14], key[22], key[30],
//								 key[38], key[46], key[54], key[62], key[35], key[43], key[51], key[59],
//								 key[2],  key[10], key[18], key[26], key[34], key[42], key[50], key[58],
//								 key[1],  key[9],  key[17], key[25], key[33], key[41], key[49], key[57],
//								 key[0],  key[8],  key[16], key[24], key[32], key[40], key[48], key[56]
//								};
			
			droppedKey <= { 
								 key[56],  key[48], key[40], key[32], key[24],  key[16], key[8], key[0], 
								 key[57], key[49], key[41], key[33], key[25],  key[17], key[9], key[1],
								 key[58], key[50], key[42], key[34], key[26],  key[18], key[10], key[2],
								 key[59], key[51], key[43], key[35], key[62], key[54], key[46], key[38],
								 key[30],  key[22], key[14], key[6], key[61], key[53], key[45], key[37],
								 key[29],  key[21],  key[13], key[5], key[60], key[52], key[44], key[36],
								 key[28],  key[20],  key[12], key[4], key[27], key[19], key[11], key[3]
								};
			fPd <= 1'b1;
		end else begin
			fPd <= 1'b0;
		end
	end
//			data <= {key[63:57], key[55:49], key[47:41], key[39:33], key[31:25], key[23:17], key[15:9], key[7:1]};

endmodule