module KG(
	input clk, isEnc, iKg, fPd, rd,
	output reg fKg,
	input [55:0] inKey,
	input [4:0] inRound,
	output reg [47:0] key
);
	
	reg [55:0] initKey;
	reg [47:0] roundKey [0:15];
	reg [0:55] input56;
	reg [4:0] round = 5'b0;
//	always @ (inKey) begin
//		if(fPd) initKey <= inKey;
//	end
//	assign initKey = fPd ? inKey: initKey;
	reg [27:0] left, right;

	always @(posedge clk)
	  begin
	  if(fPd && ~iKg) initKey = inKey;
	  if(iKg) begin
		 if(round == 0 || round == 1 || round == 8 || round == 15) begin
		   left = {initKey[54:28], initKey[55]};
//			left =  (initKey[55:28] << 1) | (initKey[55:28] >> (28-1));
			right = {initKey[26:0], initKey[27]};
			
		 end else begin
//			left =  (initKey[55:28] << 2) | (initKey[55:28] >> (28-2));
			left = {initKey[53:28], initKey[55:54]};
//			right = (initKey[27:0] << 2) | (initKey[27:0] >> (28-2));
			right = {initKey[25:0], initKey[27:26]};
		 end
		 input56 = {left, right};
		 if(round < 16) begin
		 if(isEnc) begin
		 roundKey[round] = {
						  input56[13], input56[16], input56[10], input56[23],
                    input56[0],  input56[4],  input56[2],  input56[27],
                    input56[14], input56[5],  input56[20], input56[9],
                    input56[22], input56[18], input56[11], input56[3],
                    input56[25], input56[7],  input56[15], input56[6],
                    input56[26], input56[19], input56[12], input56[1],
                    input56[40], input56[51], input56[30], input56[36],
                    input56[46], input56[54], input56[29], input56[39],
                    input56[50], input56[44], input56[32], input56[47],
                    input56[43], input56[48], input56[38], input56[55],
                    input56[33], input56[52], input56[45], input56[41],
                    input56[49], input56[35], input56[28], input56[31]
						  };
		 end else begin
			roundKey[15-round] = {
						  input56[13], input56[16], input56[10], input56[23],
                    input56[0],  input56[4],  input56[2],  input56[27],
                    input56[14], input56[5],  input56[20], input56[9],
                    input56[22], input56[18], input56[11], input56[3],
                    input56[25], input56[7],  input56[15], input56[6],
                    input56[26], input56[19], input56[12], input56[1],
                    input56[40], input56[51], input56[30], input56[36],
                    input56[46], input56[54], input56[29], input56[39],
                    input56[50], input56[44], input56[32], input56[47],
                    input56[43], input56[48], input56[38], input56[55],
                    input56[33], input56[52], input56[45], input56[41],
                    input56[49], input56[35], input56[28], input56[31]
						  };
		 end
		 initKey = input56;
		 end
		 if (round < 16) round = round + 1;
		 else fKg = 1'b1;
		end else begin
			fKg = 1'b0;
			round <= 0;
		end
	  end
	  
	always @(posedge clk)
		if (rd) key <= roundKey[inRound-1];
	

endmodule 
