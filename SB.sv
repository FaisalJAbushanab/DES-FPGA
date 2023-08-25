//module SB(
//  input clk, iSb,
//  input [47:0] right,
//  output reg [31:0] EPOut
//);
//	
//	wire [3:0] sBoxTable [0:3][0:15] = '{
//		'{4'd14, 4'd4,  4'd13, 4'd1, 4'd2,  4'd15, 4'd11,  4'd8,   4'd3,  4'd10, 4'd6,  4'd12, 4'd5,  4'd9,  4'd0,  4'd7},
//		'{4'd0,  4'd15, 4'd7,  4'd4, 4'd14, 4'd2,  4'd13,  4'd1,   4'd10, 4'd6,  4'd12, 4'd11, 4'd9,  4'd5,  4'd3,  4'd8},
//		'{4'd4,  4'd1,  4'd14, 4'd8, 4'd13, 4'd6,  4'd2,   4'd11,  4'd15, 4'd12, 4'd9,  4'd7,  4'd3,  4'd10, 4'd5,  4'd0},
//		'{4'd15, 4'd12, 4'd8,  4'd2, 4'd4,  4'd9,  4'd1,   4'd7,   4'd5,  4'd11, 4'd3,  4'd14, 4'd10, 4'd0,  4'd6,  4'd13}
//		};
//	wire [3:0] sBoxTable2 [0:3][0:15] = '{
//		'{4'd15, 4'd1,  4'd8,  4'd14, 4'd6,  4'd11, 4'd3,  4'd4,  4'd9,  4'd7, 4'd2,  4'd13, 4'd12, 4'd0, 4'd5,  4'd10},
//		'{4'd3,  4'd13, 4'd4,  4'd7,  4'd15, 4'd2,  4'd8,  4'd14, 4'd12, 4'd0, 4'd1,  4'd10, 4'd6,  4'd9, 4'd11, 4'd5},
//		'{4'd0,  4'd14, 4'd7,  4'd11, 4'd10, 4'd4,  4'd13, 4'd1,  4'd5,  4'd8, 4'd12, 4'd6,  4'd9,  4'd3, 4'd2,  4'd15},
//		'{4'd13, 4'd8,  4'd10, 4'd1,  4'd3,  4'd15, 4'd4,  4'd2,  4'd11, 4'd6, 4'd7,  4'd12, 4'd0,  4'd5, 4'd14, 4'd9}
//		};
//	wire [3:0] sBoxTable3 [0:3][0:15] = '{
//		'{4'd10, 4'd0,  4'd9,  4'd14, 4'd6, 4'd3,  4'd15, 4'd5,  4'd1,  4'd13, 4'd12, 4'd7,  4'd11, 4'd4,  4'd2,  4'd8}, // 00
//		'{4'd13, 4'd7,  4'd0,  4'd9,  4'd3, 4'd4,  4'd6,  4'd10, 4'd2,  4'd8,  4'd5,  4'd14, 4'd12, 4'd11, 4'd15, 4'd1}, // 01
//		'{4'd13, 4'd6,  4'd4,  4'd9,  4'd8, 4'd15, 4'd3,  4'd0,  4'd11, 4'd1,  4'd2,  4'd12, 4'd5,  4'd10, 4'd14, 4'd7},	// 10
//		'{4'd1,  4'd10, 4'd13, 4'd0,  4'd6, 4'd9,  4'd8,  4'd7,  4'd4,  4'd15, 4'd14, 4'd3,  4'd11, 4'd5,  4'd2,  4'd12}	// 11
//		};
//	wire [3:0] sBoxTable4 [0:3][0:15] = '{
//		'{4'd7,  4'd13, 4'd14, 4'd3, 4'd0,  4'd6,  4'd9,  4'd10, 4'd1,  4'd2, 4'd8, 4'd5,  4'd11, 4'd12, 4'd4,  4'd15},
//		'{4'd13, 4'd8,  4'd11, 4'd5, 4'd6,  4'd15, 4'd0,  4'd3,  4'd4,  4'd7, 4'd2, 4'd12, 4'd1,  4'd10, 4'd14, 4'd9},
//		'{4'd10, 4'd6,  4'd9,  4'd0, 4'd12, 4'd11, 4'd7,  4'd13, 4'd15, 4'd1, 4'd3, 4'd14, 4'd5,  4'd2,  4'd8,  4'd4},
//		'{4'd3,  4'd15, 4'd0,  4'd6, 4'd10, 4'd1,  4'd13, 4'd8,  4'd9,  4'd4, 4'd5, 4'd11, 4'd12, 4'd7,  4'd2,  4'd14}
//		};
//	wire [3:0] sBoxTable5 [0:3][0:15] = '{
//		'{4'd2,  4'd12, 4'd4,  4'd1,  4'd7,  4'd10, 4'd11, 4'd6,  4'd8,  4'd5,  4'd3,  4'd15, 4'd13, 4'd0, 4'd14, 4'd9},
//		'{4'd14, 4'd11, 4'd2,  4'd12, 4'd4,  4'd7,  4'd13, 4'd1,  4'd5,  4'd0,  4'd15, 4'd10, 4'd3,  4'd9, 4'd8,  4'd6},
//		'{4'd4,  4'd2,  4'd1,  4'd11, 4'd10, 4'd13, 4'd7,  4'd8,  4'd15, 4'd9,  4'd12, 4'd5,  4'd6,  4'd3, 4'd0,  4'd14},
//		'{4'd11, 4'd8,  4'd12, 4'd7,  4'd1,  4'd14, 4'd2,  4'd13, 4'd6,  4'd15, 4'd0,  4'd9,  4'd10, 4'd4, 4'd5,  4'd3}
//		};
//	wire [3:0] sBoxTable6 [0:3][0:15] = '{
//		'{4'd12, 4'd1,  4'd10, 4'd15, 4'd9, 4'd2,  4'd6,  4'd8,  4'd0,  4'd13, 4'd3,  4'd4,  4'd14, 4'd7,  4'd5,  4'd11},
//		'{4'd10, 4'd15, 4'd4,  4'd2,  4'd7, 4'd12, 4'd9,  4'd5,  4'd6,  4'd1,  4'd13, 4'd14, 4'd0,  4'd11, 4'd3,  4'd8},
//		'{4'd9,  4'd14, 4'd15, 4'd5,  4'd2, 4'd8,  4'd12, 4'd3,  4'd7,  4'd0,  4'd4,  4'd10, 4'd1,  4'd13, 4'd11, 4'd6},
//		'{4'd4,  4'd3,  4'd2,  4'd12, 4'd9, 4'd5,  4'd15, 4'd10, 4'd11, 4'd14, 4'd1,  4'd7,  4'd6,  4'd0,  4'd8,  4'd13}
//		};
//	wire [3:0] sBoxTable7 [0:3][0:15] = '{
//		'{4'd4,  4'd11, 4'd2,  4'd14, 4'd15, 4'd0, 4'd8,  4'd13, 4'd3,  4'd12, 4'd9, 4'd7,  4'd5,  4'd10, 4'd6, 4'd1},
//		'{4'd13, 4'd0,  4'd11, 4'd7,  4'd4,  4'd9, 4'd1,  4'd10, 4'd14, 4'd3,  4'd5, 4'd12, 4'd2,  4'd15, 4'd8, 4'd6},
//		'{4'd1,  4'd4,  4'd11, 4'd13, 4'd12, 4'd3, 4'd7,  4'd14, 4'd10, 4'd15, 4'd6, 4'd8,  4'd0,  4'd5,  4'd9, 4'd2},
//		'{4'd6,  4'd11, 4'd13, 4'd8,  4'd1,  4'd4, 4'd10, 4'd7,  4'd9,  4'd5,  4'd0, 4'd15, 4'd14, 4'd2,  4'd3, 4'd12}
//		};
//	wire [3:0] sBoxTable8 [0:3][0:15] = '{
//		'{4'd13, 4'd2,  4'd8,  4'd4, 4'd6,  4'd15, 4'd11, 4'd1,  4'd10, 4'd9,  4'd3,  4'd14, 4'd5,  4'd0,  4'd12, 4'd7},
//		'{4'd1,  4'd15, 4'd13, 4'd8, 4'd10, 4'd3,  4'd7,  4'd4,  4'd12, 4'd5,  4'd6,  4'd11, 4'd0,  4'd14, 4'd9,  4'd2},
//		'{4'd7,  4'd11, 4'd4,  4'd1, 4'd9,  4'd12, 4'd14, 4'd2,  4'd0,  4'd6,  4'd10, 4'd13, 4'd15, 4'd3,  4'd5,  4'd8},
//		'{4'd2,  4'd1,  4'd14, 4'd7, 4'd4,  4'd10, 4'd8,  4'd13, 4'd15, 4'd12, 4'd9,  4'd0,  4'd3,  4'd5,  4'd6,  4'd11}
//		};
//	wire [15:0] sel = '{
//						right[42], right[47], right[36], right[41], right[30], right[35],
//						right[24], right[29] ,right[18], right[23], right[12], right[17],
//						right[6],  right[11], right[0], right[5]
//		};
//	
//	assign EPOut[3:0]   = sBoxTable8[sel[15:14]][right[4:1]];
//	assign EPOut[7:4]   = sBoxTable7[sel[13:12]][right[10:7]];
//	assign EPOut[11:8]  = sBoxTable6[sel[11:10]][right[16:13]];
//	assign EPOut[15:12] = sBoxTable5[sel[9:8]][right[22:19]];
//	assign EPOut[19:16] = sBoxTable4[sel[7:6]][right[28:25]];
//	assign EPOut[23:20] = sBoxTable3[sel[5:4]][right[34:31]];
//	assign EPOut[27:24] = sBoxTable2[sel[3:2]][right[40:37]];
//	assign EPOut[31:28] = sBoxTable[sel[1:0]][right[46:43]];
	
//	reg [1:0] select1, select2, select3, select4, select5, select6, select7, select8;
//	reg [3:0] value1, value2, value3, value4, value5, value6, value7, value8;
//	always @(posedge clk) begin
//		if(iSb) begin
//			select1 <= sel[15:14];
//			select2 <= sel[13:12];	
//			select3 <= sel[11:10];
//			select4 <= sel[9:8];
//			select5 <= sel[7:6];
//			select6 <= sel[5:4];
//			select7 <= sel[3:2];
//			select8 <= sel[1:0];
//			value1 <= right[4:1];
//			value2 <= right[10:7];
//			value3 <= right[16:13];
//			value4 <= right[22:19];
//			value5 <= right[28:25];
//			value6 <= right[34:31];
//			value7 <= right[40:37];
//			value8 <= right[46:43];
//			
//			EPOut[3:0] <= sBoxTable8[select1][value1];
//			EPOut[7:4] <= sBoxTable7[select2][value2];
//			EPOut[11:8] <= sBoxTable6[select3][value3];
//			EPOut[15:12] <= sBoxTable5[select4][value4];
//			EPOut[19:16] <= sBoxTable4[select5][value5];
//			EPOut[23:20] <= sBoxTable3[select6][value6];
//			EPOut[27:24] <= sBoxTable2[select7][value7];
//			EPOut[31:28] <= sBoxTable[select8][value8];
//			
//			
////			fSb <= 1'b1;
////		end else begin
////			fSb <= 1'b0;
//		end
//	end
//endmodule 

//	always @(posedge clk) begin
//		if(iSb) begin
//			EPOut[3:0]   = sBoxTable8[sel[15:14]][right[4:1]];
//			EPOut[7:4]   = sBoxTable7[sel[13:12]][right[10:7]];
//			EPOut[11:8]  = sBoxTable6[sel[11:10]][right[16:13]];
//			EPOut[15:12] = sBoxTable5[sel[9:8]][right[22:19]];
//			EPOut[19:16] = sBoxTable4[sel[7:6]][right[28:25]];
//			EPOut[23:20] = sBoxTable3[sel[5:4]][right[34:31]];
//			EPOut[27:24] = sBoxTable2[sel[3:2]][right[40:37]];
//			EPOut[31:28] = sBoxTable[sel[1:0]][right[46:43]];
//
//		end 
//	end
//endmodule 



//
//module SB(
//  input clk, iSb,
//  output reg fSb,
//  input [47:0] right,
//  output reg [31:0] EPOut
//);
//	
//	reg [3:0] sBoxTable [3:0][15:0] = '{
//		'{4'd14, 4'd4,  4'd13, 4'd1, 4'd2,  4'd15, 4'd11, 4'd8,  4'd3,  4'd10, 4'd6,  4'd12, 4'd5,  4'd9,  4'd0,  4'd7},
//		'{4'd0,  4'd15, 4'd7,  4'd4, 4'd14, 4'd2,  4'd13, 4'd10, 4'd3,  4'd6,  4'd12, 4'd11, 4'd9,  4'd5,  4'd3,  4'd8},
//		'{4'd4,  4'd1,  4'd14, 4'd8, 4'd13, 4'd6,  4'd2,  4'd11, 4'd15, 4'd12, 4'd9,  4'd7,  4'd3,  4'd10, 4'd5,  4'd0},
//		'{4'd15, 4'd12, 4'd8,  4'd2, 4'd4,  4'd9,  4'd1,  4'd7,  4'd5,  4'd11, 4'd3,  4'd14, 4'd10, 4'd0,  4'd6,  4'd13}
//		};
//	reg [15:0] sel;
//	always @(posedge clk) begin
//		if(iSb) begin
//			sel <= {
//						right[47], right[42], right[41], right[36], right[35], right[30],
//						right[29], right[24], right[23], right[18], right[17], right[12],
//						right[11], right[6], right[5], right[0]
//					 };
//			EPOut[3:0]   <= sBoxTable[sel[1:0]][right[4:1]];
//			EPOut[7:4]   <= sBoxTable[sel[3:2]][right[10:7]];
//			EPOut[11:8]  <= sBoxTable[sel[5:4]][right[16:13]];
//			EPOut[15:12] <= sBoxTable[sel[7:6]][right[22:19]];
//			EPOut[19:16] <= sBoxTable[sel[9:8]][right[28:25]];
//			EPOut[23:20] <= sBoxTable[sel[11:10]][right[34:31]];
//			EPOut[27:24] <= sBoxTable[sel[13:12]][right[40:37]];
//			EPOut[31:28] <= sBoxTable[sel[15:14]][right[46:43]];
//			fSb <= 1'b1;
//		end else begin
//			fSb <= 1'b0;
//		end
//	end
//endmodule 