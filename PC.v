module PC(
  input clk, iPc,
  output reg fPc,
  input wire [55:0] input56,
  output reg [47:0] output48
);
  
//  assign output48 = {input56[13], input56[16], input56[10], input56[23],
//                    input56[0], input56[4], input56[2], input56[27],
//                    input56[14], input56[5], input56[20], input56[9],
//                    input56[22], input56[18], input56[11], input56[3],
//                    input56[25], input56[7], input56[15], input56[6],
//                    input56[26], input56[19], input56[12], input56[1],
//                    input56[40], input56[51], input56[30], input56[36],
//                    input56[46], input56[54], input56[29], input56[39],
//                    input56[50], input56[44], input56[32], input56[47],
//                    input56[43], input56[48], input56[38], input56[55],
//                    input56[33], input56[52], input56[45], input56[41],
//                    input56[49], input56[35], input56[28], input56[31]};
						  
//	reg [63:0] data;
		
	always @(posedge clk) begin
		if(iPc) begin
			output48 <= {
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
			fPc <= 1'b1;
		end else begin
			fPc <= 1'b0;
		end
	end

endmodule
