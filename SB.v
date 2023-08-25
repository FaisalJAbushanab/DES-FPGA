module SB(
  input clk, iAr, iSb,
  output reg fAr,
  input [47:0] right,
  output reg [31:0] EPOut
);
	
	reg [3:0] sBoxTable1 [0:3][0:15];
	reg [3:0] sBoxTable2 [0:3][0:15];
	reg [3:0] sBoxTable3 [0:3][0:15];
	reg [3:0] sBoxTable4 [0:3][0:15];
	reg [3:0] sBoxTable5 [0:3][0:15];
	reg [3:0] sBoxTable6 [0:3][0:15];
	reg [3:0] sBoxTable7 [0:3][0:15];
	reg [3:0] sBoxTable8 [0:3][0:15];
	
	reg [1:0] select1, select2, select3, select4, select5, select6, select7, select8;
	reg [3:0] value1, value2, value3, value4, value5, value6, value7, value8;
	always @(posedge clk) begin
		if(iAr) begin
			sBoxTable1[0][0] <= 4'd14; sBoxTable1[0][1] <= 4'd4;  sBoxTable1[0][2] <= 4'd13; sBoxTable1[0][3] <= 4'd1; sBoxTable1[0][4] <= 4'd2;  sBoxTable1[0][5] <= 4'd15; sBoxTable1[0][6] <= 4'd11; sBoxTable1[0][7] <= 4'd8;  sBoxTable1[0][8] <= 4'd3;  sBoxTable1[0][9] <= 4'd10; sBoxTable1[0][10] <= 4'd6;  sBoxTable1[0][11] <= 4'd12; sBoxTable1[0][12] <= 4'd5;  sBoxTable1[0][13] <= 4'd9;  sBoxTable1[0][14] <= 4'd0; sBoxTable1[0][15] <= 4'd7;
			sBoxTable1[1][0] <= 4'd0;  sBoxTable1[1][1] <= 4'd15; sBoxTable1[1][2] <= 4'd7;  sBoxTable1[1][3] <= 4'd4; sBoxTable1[1][4] <= 4'd14; sBoxTable1[1][5] <= 4'd2;  sBoxTable1[1][6] <= 4'd13; sBoxTable1[1][7] <= 4'd1;  sBoxTable1[1][8] <= 4'd10; sBoxTable1[1][9] <= 4'd6;  sBoxTable1[1][10] <= 4'd12; sBoxTable1[1][11] <= 4'd11; sBoxTable1[1][12] <= 4'd9;  sBoxTable1[1][13] <= 4'd5;  sBoxTable1[1][14] <= 4'd3; sBoxTable1[1][15] <= 4'd8;
			sBoxTable1[2][0] <= 4'd4;  sBoxTable1[2][1] <= 4'd1;  sBoxTable1[2][2] <= 4'd14; sBoxTable1[2][3] <= 4'd8; sBoxTable1[2][4] <= 4'd13; sBoxTable1[2][5] <= 4'd6;  sBoxTable1[2][6] <= 4'd2;  sBoxTable1[2][7] <= 4'd11; sBoxTable1[2][8] <= 4'd15; sBoxTable1[2][9] <= 4'd12; sBoxTable1[2][10] <= 4'd9;  sBoxTable1[2][11] <= 4'd7;  sBoxTable1[2][12] <= 4'd3;  sBoxTable1[2][13] <= 4'd10; sBoxTable1[2][14] <= 4'd5; sBoxTable1[2][15] <= 4'd0;
			sBoxTable1[3][0] <= 4'd15; sBoxTable1[3][1] <= 4'd12; sBoxTable1[3][2] <= 4'd8;  sBoxTable1[3][3] <= 4'd2; sBoxTable1[3][4] <= 4'd4;  sBoxTable1[3][5] <= 4'd9;  sBoxTable1[3][6] <= 4'd1;  sBoxTable1[3][7] <= 4'd7;  sBoxTable1[3][8] <= 4'd5;  sBoxTable1[3][9] <= 4'd11; sBoxTable1[3][10] <= 4'd3;  sBoxTable1[3][11] <= 4'd14; sBoxTable1[3][12] <= 4'd10; sBoxTable1[3][13] <= 4'd0;  sBoxTable1[3][14] <= 4'd6; sBoxTable1[3][15]  <= 4'd13;
			
			sBoxTable2[0][0] <= 4'd15; sBoxTable2[0][1] <= 4'd1;  sBoxTable2[0][2] <= 4'd8;  sBoxTable2[0][3] <= 4'd14; sBoxTable2[0][4] <= 4'd6;  sBoxTable2[0][5] <= 4'd11; sBoxTable2[0][6] <= 4'd3;  sBoxTable2[0][7] <= 4'd4;  sBoxTable2[0][8] <= 4'd9;  sBoxTable2[0][9] <= 4'd7; sBoxTable2[0][10] <= 4'd2;  sBoxTable2[0][11] <= 4'd13; sBoxTable2[0][12] <= 4'd12; sBoxTable2[0][13] <= 4'd0; sBoxTable2[0][14] <= 4'd5;  sBoxTable2[0][15] <= 4'd10;
			sBoxTable2[1][0] <= 4'd3;  sBoxTable2[1][1] <= 4'd13; sBoxTable2[1][2] <= 4'd4;  sBoxTable2[1][3] <= 4'd7;  sBoxTable2[1][4] <= 4'd15; sBoxTable2[1][5] <= 4'd2;  sBoxTable2[1][6] <= 4'd8;  sBoxTable2[1][7] <= 4'd14; sBoxTable2[1][8] <= 4'd12; sBoxTable2[1][9] <= 4'd0; sBoxTable2[1][10] <= 4'd1;  sBoxTable2[1][11] <= 4'd10; sBoxTable2[1][12] <= 4'd6;  sBoxTable2[1][13] <= 4'd9; sBoxTable2[1][14] <= 4'd11; sBoxTable2[1][15] <= 4'd5;
			sBoxTable2[2][0] <= 4'd0;  sBoxTable2[2][1] <= 4'd14; sBoxTable2[2][2] <= 4'd7;  sBoxTable2[2][3] <= 4'd11; sBoxTable2[2][4] <= 4'd10; sBoxTable2[2][5] <= 4'd4;  sBoxTable2[2][6] <= 4'd13; sBoxTable2[2][7] <= 4'd1;  sBoxTable2[2][8] <= 4'd5;  sBoxTable2[2][9] <= 4'd8; sBoxTable2[2][10] <= 4'd12; sBoxTable2[2][11] <= 4'd6;  sBoxTable2[2][12] <= 4'd9;  sBoxTable2[2][13] <= 4'd3; sBoxTable2[2][14] <= 4'd2;  sBoxTable2[2][15] <= 4'd15;
			sBoxTable2[3][0] <= 4'd13; sBoxTable2[3][1] <= 4'd8;  sBoxTable2[3][2] <= 4'd10; sBoxTable2[3][3] <= 4'd1;  sBoxTable2[3][4] <= 4'd3;  sBoxTable2[3][5] <= 4'd15; sBoxTable2[3][6] <= 4'd4;  sBoxTable2[3][7] <= 4'd2;  sBoxTable2[3][8] <= 4'd11; sBoxTable2[3][9] <= 4'd6; sBoxTable2[3][10] <= 4'd7;  sBoxTable2[3][11] <= 4'd12; sBoxTable2[3][12] <= 4'd0;  sBoxTable2[3][13] <= 4'd5; sBoxTable2[3][14] <= 4'd14; sBoxTable2[3][15] <= 4'd9;
			
			sBoxTable3[0][0] <= 4'd10; sBoxTable3[0][1] <= 4'd0;  sBoxTable3[0][2] <= 4'd9;  sBoxTable3[0][3] <= 4'd14; sBoxTable3[0][4] <= 4'd6; sBoxTable3[0][5] <= 4'd3;  sBoxTable3[0][6] <= 4'd15; sBoxTable3[0][7] <= 4'd5;  sBoxTable3[0][8] <= 4'd1;  sBoxTable3[0][9] <= 4'd13; sBoxTable3[0][10] <= 4'd12; sBoxTable3[0][11] <= 4'd7;  sBoxTable3[0][12] <= 4'd11; sBoxTable3[0][13] <= 4'd4;  sBoxTable3[0][14] <= 4'd2;  sBoxTable3[0][15] <= 4'd8;
			sBoxTable3[1][0] <= 4'd13; sBoxTable3[1][1] <= 4'd7;  sBoxTable3[1][2] <= 4'd0;  sBoxTable3[1][3] <= 4'd9;  sBoxTable3[1][4] <= 4'd3; sBoxTable3[1][5] <= 4'd4;  sBoxTable3[1][6] <= 4'd6;  sBoxTable3[1][7] <= 4'd10; sBoxTable3[1][8] <= 4'd2;  sBoxTable3[1][9] <= 4'd8;  sBoxTable3[1][10] <= 4'd5;  sBoxTable3[1][11] <= 4'd14; sBoxTable3[1][12] <= 4'd12; sBoxTable3[1][13] <= 4'd11; sBoxTable3[1][14] <= 4'd15; sBoxTable3[1][15] <= 4'd1;
			sBoxTable3[2][0] <= 4'd13; sBoxTable3[2][1] <= 4'd6;  sBoxTable3[2][2] <= 4'd4;  sBoxTable3[2][3] <= 4'd9;  sBoxTable3[2][4] <= 4'd8; sBoxTable3[2][5] <= 4'd15; sBoxTable3[2][6] <= 4'd3;  sBoxTable3[2][7] <= 4'd0;  sBoxTable3[2][8] <= 4'd11; sBoxTable3[2][9] <= 4'd1;  sBoxTable3[2][10] <= 4'd2;  sBoxTable3[2][11] <= 4'd12; sBoxTable3[2][12] <= 4'd5;  sBoxTable3[2][13] <= 4'd10; sBoxTable3[2][14] <= 4'd14; sBoxTable3[2][15] <= 4'd7;
			sBoxTable3[3][0] <= 4'd1;  sBoxTable3[3][1] <= 4'd10; sBoxTable3[3][2] <= 4'd13; sBoxTable3[3][3] <= 4'd0;  sBoxTable3[3][4] <= 4'd6; sBoxTable3[3][5] <= 4'd9;  sBoxTable3[3][6] <= 4'd8;  sBoxTable3[3][7] <= 4'd7;  sBoxTable3[3][8] <= 4'd4;  sBoxTable3[3][9] <= 4'd15; sBoxTable3[3][10] <= 4'd14; sBoxTable3[3][11] <= 4'd3;  sBoxTable3[3][12] <= 4'd11; sBoxTable3[3][13] <= 4'd5;  sBoxTable3[3][14] <= 4'd2;  sBoxTable3[3][15] <= 4'd12;
			
			sBoxTable4[0][0] <= 4'd7;  sBoxTable4[0][1] <= 4'd13; sBoxTable4[0][2] <= 4'd14; sBoxTable4[0][3] <= 4'd3; sBoxTable4[0][4] <= 4'd0;  sBoxTable4[0][5] <= 4'd6;  sBoxTable4[0][6] <= 4'd9;  sBoxTable4[0][7] <= 4'd10; sBoxTable4[0][8] <= 4'd1;  sBoxTable4[0][9] <= 4'd2; sBoxTable4[0][10] <= 4'd8; sBoxTable4[0][11] <= 4'd5;  sBoxTable4[0][12] <= 4'd11; sBoxTable4[0][13] <= 4'd12; sBoxTable4[0][14] <= 4'd4;  sBoxTable4[0][15] <= 4'd15;
			sBoxTable4[1][0] <= 4'd13; sBoxTable4[1][1] <= 4'd8;  sBoxTable4[1][2] <= 4'd11; sBoxTable4[1][3] <= 4'd5; sBoxTable4[1][4] <= 4'd6;  sBoxTable4[1][5] <= 4'd15; sBoxTable4[1][6] <= 4'd0;  sBoxTable4[1][7] <= 4'd3;  sBoxTable4[1][8] <= 4'd4;  sBoxTable4[1][9] <= 4'd7; sBoxTable4[1][10] <= 4'd2; sBoxTable4[1][11] <= 4'd12; sBoxTable4[1][12] <= 4'd1;  sBoxTable4[1][13] <= 4'd10; sBoxTable4[1][14] <= 4'd14; sBoxTable4[1][15] <= 4'd9;
			sBoxTable4[2][0] <= 4'd10; sBoxTable4[2][1] <= 4'd6;  sBoxTable4[2][2] <= 4'd9;  sBoxTable4[2][3] <= 4'd0; sBoxTable4[2][4] <= 4'd12; sBoxTable4[2][5] <= 4'd11; sBoxTable4[2][6] <= 4'd7;  sBoxTable4[2][7] <= 4'd13; sBoxTable4[2][8] <= 4'd15; sBoxTable4[2][9] <= 4'd1; sBoxTable4[2][10] <= 4'd3; sBoxTable4[2][11] <= 4'd14; sBoxTable4[2][12] <= 4'd5;  sBoxTable4[2][13] <= 4'd2;  sBoxTable4[2][14] <= 4'd8;  sBoxTable4[2][15] <= 4'd4;
			sBoxTable4[3][0] <= 4'd3;  sBoxTable4[3][1] <= 4'd15; sBoxTable4[3][2] <= 4'd0;  sBoxTable4[3][3] <= 4'd6; sBoxTable4[3][4] <= 4'd10; sBoxTable4[3][5] <= 4'd1;  sBoxTable4[3][6] <= 4'd13; sBoxTable4[3][7] <= 4'd8;  sBoxTable4[3][8] <= 4'd9;  sBoxTable4[3][9] <= 4'd4; sBoxTable4[3][10] <= 4'd5; sBoxTable4[3][11] <= 4'd11; sBoxTable4[3][12] <= 4'd12; sBoxTable4[3][13] <= 4'd7;  sBoxTable4[3][14] <= 4'd2;  sBoxTable4[3][15] <= 4'd14;
			
			sBoxTable5[0][0] <= 4'd2;  sBoxTable5[0][1] <= 4'd12; sBoxTable5[0][2] <= 4'd4;  sBoxTable5[0][3] <= 4'd1;  sBoxTable5[0][4] <= 4'd7;  sBoxTable5[0][5] <= 4'd10; sBoxTable5[0][6] <= 4'd11; sBoxTable5[0][7] <= 4'd6;  sBoxTable5[0][8] <= 4'd8;  sBoxTable5[0][9] <= 4'd5;  sBoxTable5[0][10] <= 4'd3;  sBoxTable5[0][11] <= 4'd15; sBoxTable5[0][12] <= 4'd13; sBoxTable5[0][13] <= 4'd0; sBoxTable5[0][14] <= 4'd14; sBoxTable5[0][15] <= 4'd9;
			sBoxTable5[1][0] <= 4'd14; sBoxTable5[1][1] <= 4'd11; sBoxTable5[1][2] <= 4'd2;  sBoxTable5[1][3] <= 4'd12; sBoxTable5[1][4] <= 4'd4;  sBoxTable5[1][5] <= 4'd7;  sBoxTable5[1][6] <= 4'd13; sBoxTable5[1][7] <= 4'd1;  sBoxTable5[1][8] <= 4'd5;  sBoxTable5[1][9] <= 4'd0;  sBoxTable5[1][10] <= 4'd15; sBoxTable5[1][11] <= 4'd10; sBoxTable5[1][12] <= 4'd3;  sBoxTable5[1][13] <= 4'd9; sBoxTable5[1][14] <= 4'd8;  sBoxTable5[1][15] <= 4'd6;
			sBoxTable5[2][0] <= 4'd4;  sBoxTable5[2][1] <= 4'd2;  sBoxTable5[2][2] <= 4'd1;  sBoxTable5[2][3] <= 4'd11; sBoxTable5[2][4] <= 4'd10; sBoxTable5[2][5] <= 4'd13; sBoxTable5[2][6] <= 4'd7;  sBoxTable5[2][7] <= 4'd8;  sBoxTable5[2][8] <= 4'd15; sBoxTable5[2][9] <= 4'd9;  sBoxTable5[2][10] <= 4'd12; sBoxTable5[2][11] <= 4'd5;  sBoxTable5[2][12] <= 4'd6;  sBoxTable5[2][13] <= 4'd3; sBoxTable5[2][14] <= 4'd0;  sBoxTable5[2][15] <= 4'd14;
			sBoxTable5[3][0] <= 4'd11; sBoxTable5[3][1] <= 4'd8;  sBoxTable5[3][2] <= 4'd12; sBoxTable5[3][3] <= 4'd7;  sBoxTable5[3][4] <= 4'd1;  sBoxTable5[3][5] <= 4'd14; sBoxTable5[3][6] <= 4'd2;  sBoxTable5[3][7] <= 4'd13; sBoxTable5[3][8] <= 4'd6;  sBoxTable5[3][9] <= 4'd15; sBoxTable5[3][10] <= 4'd0;  sBoxTable5[3][11] <= 4'd9;  sBoxTable5[3][12] <= 4'd10; sBoxTable5[3][13] <= 4'd4; sBoxTable5[3][14] <= 4'd5;  sBoxTable5[3][15] <= 4'd3;
			
			sBoxTable6[0][0] <= 4'd12; sBoxTable6[0][1] <= 4'd1;  sBoxTable6[0][2] <= 4'd10; sBoxTable6[0][3] <= 4'd15; sBoxTable6[0][4] <= 4'd9; sBoxTable6[0][5] <= 4'd2;  sBoxTable6[0][6] <= 4'd6;  sBoxTable6[0][7] <= 4'd8;  sBoxTable6[0][8] <= 4'd0;  sBoxTable6[0][9] <= 4'd13; sBoxTable6[0][10] <= 4'd3;  sBoxTable6[0][11] <= 4'd4;  sBoxTable6[0][12] <= 4'd14; sBoxTable6[0][13] <= 4'd7;  sBoxTable6[0][14] <= 4'd5;  sBoxTable6[0][15] <= 4'd11;
			sBoxTable6[1][0] <= 4'd10; sBoxTable6[1][1] <= 4'd15; sBoxTable6[1][2] <= 4'd4;  sBoxTable6[1][3] <= 4'd2;  sBoxTable6[1][4] <= 4'd7; sBoxTable6[1][5] <= 4'd12; sBoxTable6[1][6] <= 4'd9;  sBoxTable6[1][7] <= 4'd5;  sBoxTable6[1][8] <= 4'd6;  sBoxTable6[1][9] <= 4'd1;  sBoxTable6[1][10] <= 4'd13; sBoxTable6[1][11] <= 4'd14; sBoxTable6[1][12] <= 4'd0;  sBoxTable6[1][13] <= 4'd11; sBoxTable6[1][14] <= 4'd3;  sBoxTable6[1][15] <= 4'd8;
			sBoxTable6[2][0] <= 4'd9;  sBoxTable6[2][1] <= 4'd14; sBoxTable6[2][2] <= 4'd15; sBoxTable6[2][3] <= 4'd5;  sBoxTable6[2][4] <= 4'd2; sBoxTable6[2][5] <= 4'd8;  sBoxTable6[2][6] <= 4'd12; sBoxTable6[2][7] <= 4'd3;  sBoxTable6[2][8] <= 4'd7;  sBoxTable6[2][9] <= 4'd0;  sBoxTable6[2][10] <= 4'd4;  sBoxTable6[2][11] <= 4'd10; sBoxTable6[2][12] <= 4'd1;  sBoxTable6[2][13] <= 4'd13; sBoxTable6[2][14] <= 4'd11; sBoxTable6[2][15] <= 4'd6;
			sBoxTable6[3][0] <= 4'd4;  sBoxTable6[3][1] <= 4'd3;  sBoxTable6[3][2] <= 4'd2;  sBoxTable6[3][3] <= 4'd12; sBoxTable6[3][4] <= 4'd9; sBoxTable6[3][5] <= 4'd5;  sBoxTable6[3][6] <= 4'd15; sBoxTable6[3][7] <= 4'd10; sBoxTable6[3][8] <= 4'd11; sBoxTable6[3][9] <= 4'd14; sBoxTable6[3][10] <= 4'd1;  sBoxTable6[3][11] <= 4'd7;  sBoxTable6[3][12] <= 4'd6;  sBoxTable6[3][13] <= 4'd0;  sBoxTable6[3][14] <= 4'd8;  sBoxTable6[3][15] <= 4'd13;
			
			sBoxTable7[0][0] <= 4'd4;  sBoxTable7[0][1] <= 4'd11; sBoxTable7[0][2] <= 4'd2;  sBoxTable7[0][3] <= 4'd14; sBoxTable7[0][4] <= 4'd15; sBoxTable7[0][5] <= 4'd0; sBoxTable7[0][6] <= 4'd8;  sBoxTable7[0][7] <= 4'd13; sBoxTable7[0][8] <= 4'd3;  sBoxTable7[0][9] <= 4'd12; sBoxTable7[0][10] <= 4'd9; sBoxTable7[0][11] <= 4'd7;  sBoxTable7[0][12] <= 4'd5;  sBoxTable7[0][13] <= 4'd10; sBoxTable7[0][14] <= 4'd6;  sBoxTable7[0][15] <= 4'd1;
			sBoxTable7[1][0] <= 4'd13; sBoxTable7[1][1] <= 4'd0;  sBoxTable7[1][2] <= 4'd11; sBoxTable7[1][3] <= 4'd7;  sBoxTable7[1][4] <= 4'd4;  sBoxTable7[1][5] <= 4'd9; sBoxTable7[1][6] <= 4'd1;  sBoxTable7[1][7] <= 4'd10; sBoxTable7[1][8] <= 4'd14; sBoxTable7[1][9] <= 4'd3;  sBoxTable7[1][10] <= 4'd5; sBoxTable7[1][11] <= 4'd12; sBoxTable7[1][12] <= 4'd2;  sBoxTable7[1][13] <= 4'd15; sBoxTable7[1][14] <= 4'd8;  sBoxTable7[1][15] <= 4'd6;
			sBoxTable7[2][0] <= 4'd1;  sBoxTable7[2][1] <= 4'd4;  sBoxTable7[2][2] <= 4'd11; sBoxTable7[2][3] <= 4'd13; sBoxTable7[2][4] <= 4'd12; sBoxTable7[2][5] <= 4'd3; sBoxTable7[2][6] <= 4'd7;  sBoxTable7[2][7] <= 4'd14; sBoxTable7[2][8] <= 4'd10; sBoxTable7[2][9] <= 4'd15; sBoxTable7[2][10] <= 4'd6; sBoxTable7[2][11] <= 4'd8;  sBoxTable7[2][12] <= 4'd0;  sBoxTable7[2][13] <= 4'd5;  sBoxTable7[2][14] <= 4'd9;  sBoxTable7[2][15] <= 4'd2;
			sBoxTable7[3][0] <= 4'd6;  sBoxTable7[3][1] <= 4'd11; sBoxTable7[3][2] <= 4'd13; sBoxTable7[3][3] <= 4'd8;  sBoxTable7[3][4] <= 4'd1;  sBoxTable7[3][5] <= 4'd4; sBoxTable7[3][6] <= 4'd10; sBoxTable7[3][7] <= 4'd7;  sBoxTable7[3][8] <= 4'd9;  sBoxTable7[3][9] <= 4'd5;  sBoxTable7[3][10] <= 4'd0; sBoxTable7[3][11] <= 4'd15; sBoxTable7[3][12] <= 4'd14; sBoxTable7[3][13] <= 4'd2;  sBoxTable7[3][14] <= 4'd3;  sBoxTable7[3][15] <= 4'd12;
			
			sBoxTable8[0][0] <= 4'd13; sBoxTable8[0][1] <= 4'd2;  sBoxTable8[0][2] <= 4'd8;  sBoxTable8[0][3] <= 4'd4; sBoxTable8[0][4] <= 4'd6;  sBoxTable8[0][5] <= 4'd15; sBoxTable8[0][6] <= 4'd11; sBoxTable8[0][7] <= 4'd1;  sBoxTable8[0][8] <= 4'd10; sBoxTable8[0][9] <= 4'd9;  sBoxTable8[0][10] <= 4'd3;  sBoxTable8[0][11] <= 4'd14; sBoxTable8[0][12] <= 4'd5;  sBoxTable8[0][13] <= 4'd0;  sBoxTable8[0][14] <= 4'd12; sBoxTable8[0][15] <= 4'd7;
			sBoxTable8[1][0] <= 4'd1;  sBoxTable8[1][1] <= 4'd15; sBoxTable8[1][2] <= 4'd13; sBoxTable8[1][3] <= 4'd8; sBoxTable8[1][4] <= 4'd10; sBoxTable8[1][5] <= 4'd3;  sBoxTable8[1][6] <= 4'd7;  sBoxTable8[1][7] <= 4'd4;  sBoxTable8[1][8] <= 4'd12; sBoxTable8[1][9] <= 4'd5;  sBoxTable8[1][10] <= 4'd6;  sBoxTable8[1][11] <= 4'd11; sBoxTable8[1][12] <= 4'd0;  sBoxTable8[1][13] <= 4'd14; sBoxTable8[1][14] <= 4'd9;  sBoxTable8[1][15] <= 4'd2;
			sBoxTable8[2][0] <= 4'd7;  sBoxTable8[2][1] <= 4'd11; sBoxTable8[2][2] <= 4'd4;  sBoxTable8[2][3] <= 4'd1; sBoxTable8[2][4] <= 4'd9;  sBoxTable8[2][5] <= 4'd12; sBoxTable8[2][6] <= 4'd14; sBoxTable8[2][7] <= 4'd2;  sBoxTable8[2][8] <= 4'd0;  sBoxTable8[2][9] <= 4'd6;  sBoxTable8[2][10] <= 4'd10; sBoxTable8[2][11] <= 4'd13; sBoxTable8[2][12] <= 4'd15; sBoxTable8[2][13] <= 4'd3;  sBoxTable8[2][14] <= 4'd5;  sBoxTable8[2][15] <= 4'd8;
			sBoxTable8[3][0] <= 4'd2;  sBoxTable8[3][1] <= 4'd1;  sBoxTable8[3][2] <= 4'd14; sBoxTable8[3][3] <= 4'd7; sBoxTable8[3][4] <= 4'd4;  sBoxTable8[3][5] <= 4'd10; sBoxTable8[3][6] <= 4'd8;  sBoxTable8[3][7] <= 4'd13; sBoxTable8[3][8] <= 4'd15; sBoxTable8[3][9] <= 4'd12; sBoxTable8[3][10] <= 4'd9;  sBoxTable8[3][11] <= 4'd0;  sBoxTable8[3][12] <= 4'd3;  sBoxTable8[3][13] <= 4'd5;  sBoxTable8[3][14] <= 4'd6;  sBoxTable8[3][15] <=  4'd11;
			fAr <= 1'b1;
		end else if (iSb) begin
			
			select1 <= {right[5], right[0]};
			select2 <= {right[11], right[6]};	
			select3 <= {right[17], right[12]};
			select4 <= {right[23], right[18]};
			select5 <= {right[29], right[24]};
			select6 <= {right[35], right[30]};
			select7 <= {right[41],  right[36]};
			select8 <= {right[47],  right[42]};
			
			value1 <= right[4:1];
			value2 <= right[10:7];
			value3 <= right[16:13];
			value4 <= right[22:19];
			value5 <= right[28:25];
			value6 <= right[34:31];
			value7 <= right[40:37];
			value8 <= right[46:43];
			
			EPOut[3:0] <= sBoxTable8[select1][value1];
			EPOut[7:4] <= sBoxTable7[select2][value2];
			EPOut[11:8] <= sBoxTable6[select3][value3];
			EPOut[15:12] <= sBoxTable5[select4][value4];
			EPOut[19:16] <= sBoxTable4[select5][value5];
			EPOut[23:20] <= sBoxTable3[select6][value6];
			EPOut[27:24] <= sBoxTable2[select7][value7];
			EPOut[31:28] <= sBoxTable1[select8][value8];
			
			
			fAr <= 1'b0;
		end else begin
			fAr <= 1'b0;
		end
	end
endmodule 