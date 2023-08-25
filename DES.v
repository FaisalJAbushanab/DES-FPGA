module DES(
	 
  output d00, d01, d02, d03, d04, d05, d06,   
  output d10, d11, d12, d13, d14, d15, d16,   
  output d20, d21, d22, d23, d24, d25, d26,
  output d30, d31, d32, d33, d34, d35, d36,   
  output d40, d41, d42, d43, d44, d45, d46,   
  output d50, d51, d52, d53, d54, d55, d56,
  output led1, led2, led3, led4, led5, led6, led7, led8,
  // Status signals
	input   right,   	// SW[0]
	input	  isEnc,   	// SW[1]
	input	  m0, m1, m2,   // SW[2]
	// 
	input   reset, psh,  // active low clear
	input   CLK_50MHZ,
	output tx
);
	
//	reg [31:0] count = 0;
	wire ready; 
	wire clok;
	reg start;
	reg [63:0] plaintext, key, ciphertext, iC;
	wire [63:0] cipher, ic, rD;
	wire [3:0] state;
	wire [4:0] round;
	wire [55:0] pd;
	wire [47:0] roundKey, xoro, EP;
	wire [31:0] SB, SP, leftR, rightR;
//	clk CD(CLK_50MHZ, clok, reset);
	segment7 HD1({1'b0, ciphertext[3:0]},   {1'b0, ciphertext[27:24]}, {1'b0, ciphertext[51:48]}, psh, d00, d01, d02, d03, d04, d05, d06);
	segment7 HD2({1'b0, ciphertext[7:4]},   {1'b0, ciphertext[31:28]}, {1'b0, ciphertext[55:52]}, psh, d10, d11, d12, d13, d14, d15, d16);
	segment7 HD3({1'b0, ciphertext[11:8]},  {1'b0, ciphertext[35:32]}, {1'b0, ciphertext[59:56]}, psh, d20, d21, d22, d23, d24, d25, d26);
	segment7 HD4({1'b0, ciphertext[15:12]}, {1'b0, ciphertext[39:36]}, {1'b0, ciphertext[63:60]}, psh, d30, d31, d32, d33, d34, d35, d36);
	segment7 HD5({1'b0, ciphertext[19:16]}, {1'b0, ciphertext[43:40]}, 5'b10000, psh, d40, d41, d42, d43, d44, d45, d46);
	segment7 HD6({1'b0, ciphertext[23:20]}, {1'b0, ciphertext[47:44]}, 5'b10000, psh, d50, d51, d52, d53, d54, d55, d56);
//	always @(negedge CLK_50MHZ) begin
//		led4 = rD[63:32] == 32'b01110111001110001101001101000101 ? 1'b1 : 1'b0;
//		case (round) 
//			1: begin
//				led3 <= roundKey == 48'h10000000000 ? 1'b1 : 1'b0;
//				led1 <= rightR == 32'b0 ? 1'b1 : 1'b0; 
//				led2 <= leftR == 32'b00000000000000000000000010000000 ? 1'b1 : 1'b0;
//				led4 <= EP == 48'b000000000000000000000000000000000000000000000000 ? 1'b1 : 1'b0;
//				led5 <= xoro == 48'b000000010000000000000000000000000000000000000000 ? 1'b1 : 1'b0;
//				led6 <= SB == 32'b11101001101001110010110001001101 ? 1'b1 : 1'b0;
//				led7 <= SP == 32'b10011000110110001101101110101100 ? 1'b1 : 1'b0;
//				led8 <= rD == 64'b0000000000000000000000001000000000000000000000000000000000000000 ? 1'b1 : 1'b0;
////				led4 = ic == 47'b000000000000000000000000000000000000000000000000 ? 1'b1 : 1'b0;	
//			end
//			2: begin
//				led3 = roundKey == 48'h8000000 ? 1'b1 : 1'b0;
//				led1 <= rightR == 32'b10011000110110001101101100101100 ? 1'b1 : 1'b0; 
//				led2 <= leftR == 32'b00000000000000000000000000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b010011110001011011110001011011110110100101011001 ? 1'b1 : 1'b0;
//				led5 = xoro == 48'b010011110001011011111001011011110110100101011001 ? 1'b1 : 1'b0;
//				led6 = SB == 32'b01101011101111001001101011010000 ? 1'b1 : 1'b0;
//				led7 = SP == 32'b01110111001110001101001101000101 ? 1'b1 : 1'b0;
//				led8 = rD == 64'b0000000000000000000000000000000010011000110110001101101100101100 ? 1'b1 : 1'b0;
//			end
//			3: begin
//				led3 = roundKey == 48'h0 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b101110101110100111110001011010100110101000001010 ? 1'b1 : 1'b0;
//				led1 <= rightR == 32'b01110111001110001101001101000101 ? 1'b1 : 1'b0; 
//				led2 <= leftR == 32'b10011000110110001101101100101100 ? 1'b1 : 1'b0;
//				led5 = xoro == 48'b101110101110100111110001011010100110101000001010 ? 1'b1 : 1'b0;
//				led6 = SB == 32'b10110001000010010000010111001111 ? 1'b1 : 1'b0;
//				led7 = SP == 32'b10001000100100100110101001101011 ? 1'b1 : 1'b0;
//				led8 = rD == 64'b1001100011011000110110110010110001110111001110001101001101000101 ? 1'b1 : 1'b0;
//			end
//			4: begin
//				led3 = roundKey == 47'h800000000 ? 1'b1 : 1'b0;
//				led1 <= rightR == 32'b00010000010010101011000101000111 ? 1'b1 : 1'b0; 
//				led2 <= leftR == 32'b01110111001110001101001101000101 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b100010100000001001010101010110100010101000001110 ? 1'b1 : 1'b0;
//				led5 = xoro == 48'b100010100000101001010101010110100010101000001110 ? 1'b1 : 1'b0;
//				led6 = SB == 32'b00010000011000101111111011000001 ? 1'b1 : 1'b0;
//				led7 = SP == 32'b00110001011101010000100010001111 ? 1'b1 : 1'b0;
//				led8 = rD == 64'b0111011100111000110100110100010100010000010010101011000101000111 ? 1'b1 : 1'b0;
//			end
//			5: begin
//				led3 = roundKey == 48'h2000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b001000001100001001011011111011110111111001010100 ? 1'b1 : 1'b0;
//				led5 = xoro == 48'b001000001110001001011011111011110111111001010100 ? 1'b1 : 1'b0;
//				led6 = SB == 32'b00100100001110100100011111100011 ? 1'b1 : 1'b0;
//				led7 = SP == 32'b00000100011101100010111001011101 ? 1'b1 : 1'b0;
//			end
//			6: begin
//				led3 = roundKey == 48'h400000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b000010101000000111111001010011111110100011110100 ? 1'b1 : 1'b0;
//				led5 = xoro == 48'b000010101000010111111001010011111110100011110100 ? 1'b1 : 1'b0;
//				led6 = SB == 32'b01001010111011000000011010111010 ? 1'b1 : 1'b0;
//				led7 = SP == 32'b01001010001010111001010101001101 ? 1'b1 : 1'b0;
//			end
//			7: begin
//				led3 = roundKey == 48'h400000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b100001011000001100001100001001011101010000001110 ? 1'b1 : 1'b0;
//			end
//			8: begin
//				led3 = roundKey == 48'h8000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b010010100100000010100010100110100100001001011001 ? 1'b1 : 1'b0;
//			end
//			9: begin
//				led3 = roundKey == 48'h800000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b100111111011110011111100000111111000000011111110 ? 1'b1 : 1'b0;
//			end
//			10: begin
//				led3 = roundKey == 48'h200000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b010011111110100010101001011010100110100011110001 ? 1'b1 : 1'b0;
//			end
//			11: begin
//				led3 = roundKey == 48'h1000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b001110100111111010101011111010100110101100000100 ? 1'b1 : 1'b0;
//			end
//			12: begin
//				led3 = roundKey == 48'h40000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b001110101011110001011001010110101101010010101000 ? 1'b1 : 1'b0;
//			end
//			13: begin
//				led3 = roundKey == 48'h4000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b110001011100001101010011110111110101011111111111 ? 1'b1 : 1'b0;
//			end
//			14: begin
//				led3 = roundKey == 48'h100000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b011011111001011010101110100001010101010000000101 ? 1'b1 : 1'b0;
//			end
//			15: begin
//				led3 = roundKey == 48'h1000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b100110101010101101010010100000001110100010101010 ? 1'b1 : 1'b0;
//			end
//			16: begin
//				led3 = roundKey == 48'h80000000000 ? 1'b1 : 1'b0;
//				led4 = EP == 48'b001000001000000000000110100011110111110110100100 ? 1'b1 : 1'b0;
//			end
//		endcase
//	end
	always @(posedge CLK_50MHZ) begin
		if(right == 1'b1 && state == 0) begin
			if({m2, m1, m0} == 0) begin
				if(~isEnc)
					plaintext =   64'h162B9D97957671F4;
					else
						plaintext =   64'h48656C6C6F20576F;
					key = 		  	  64'h68756C6C6F00006E;
			end else if({m2, m1, m0} == 1) begin
				if(~isEnc)
						plaintext =   64'hCDE6248EAFAAEA96;
					else
						plaintext =   64'h726C642120454534;
					key = 		  64'h68756C6C6F00006E;
			end else if({m2, m1, m0} == 2) begin
				if(~isEnc)
						plaintext =   64'h4ECC3F76985507E8;
					else
						plaintext =   64'h00003630204B4155;
					key = 		  	  64'h68756C6C6F00006E;
			end
			
			start = 1'b1;
		end else
			start = 1'b0;
	end
//	assign led1 = (cipher == 64'b11100000101011110001000001100101001010010001111100000001010110) ? 1'b1 : 1'b0;
	// led indicators
	assign led1 = right;
	assign led2 = isEnc;
	assign led4 = m0;
	assign led5 = m1;
	assign led6 = m2;
// control signals
wire ip, iFp, iKg, iPc, iRd, iEx, iXr, iAr, iSb, iSp, done;
// status signals
wire fIp, fPd, fKg, fPc, fRd, fFp, fEx, fXr, fAr, fSb, fSp;
reg start_send;
//	assign led2 = iRd;
	
//	assign led1 = iSb;
//	assign led2 = fSb;
	
	// init: indicate the starting of initial permutation and parity bits drop
	// fInit: indicate that the initiaion process is finished
	// fb: indicate final permutation start.
	uart_send sender(cipher, start_send == 1, CLK_50MHZ, reset, tx, ready); 
	always @(posedge CLK_50MHZ) begin
		if(fFp) begin
				ciphertext = cipher;
				start_send = 1'b1;
		end
		if(fIp) iC <= ic;
		if(~reset) begin
			ciphertext <= 63'b0;
			start_send = 1'b0;
		end
//		else ciphertext <= ciphertext;
	end
	
	Control CU(iAr, ip, iFp, iKg, iRd, iEx, iXr, iSb, iSp, done,
				  CLK_50MHZ, start, reset, fAr,
				  fIp, fPd, fKg, fRd, fEx, fXr, fSb, fSp,
				  fFp, round, state
	);
	Datapath DP(CLK_50MHZ, isEnc, reset, plaintext, key, cipher, round,
					ip, iFp, iKg, iRd,iEx, iXr, iAr, iSb, iSp,
					fIp, fPd, fKg, fRd, fEx, fXr, fAr, fSb, fSp, fFp, ic, rD,pd, roundKey, xoro, EP, SB, SP, leftR, rightR
	);

endmodule

