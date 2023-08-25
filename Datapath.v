module Datapath(
  input wire clk, isEnc, reset,
  input wire [63:0] plaintext,
  input wire [63:0] key,
  output reg [63:0] ciphertext,
  input wire [4:0] round,
  input  ip, iFp, iKg, iRd, iEx, iXr, iAr, iSb, iSp,
  output fIp, fPd, fKg, fRd, fEx, fXr, fAr, fSb, fSp, fFp,
  output reg [63:0] ic, rD,
  output [55:0] prevKey,
  output [47:0] roundKey,
  output [47:0] xoro, EP,
  output [31:0] SB, SP,
  output reg [31:0] leftReg, rightReg
  
);

	wire [31:0] leftIp, rightIp, leftRd, rightRd;
	
	wire rdKey;
	wire [55:0] newKey;
//	reg [47:0] keys [0:15];
	wire [63:0] out;
	
//	always @(prevKey)
//			currKey <= prevKey;
	always @(posedge clk) 
		if (iFp) ciphertext <= out;
   IP InitialPermutation(clk, reset, ip, fIp, plaintext, leftIp, rightIp); // performe initial permutation on orignal plaintext
	PD ParityDrop(clk, ip, fPd, key, prevKey); // remove parity bits from original key
	KG roundKeyGenerate(clk, isEnc, iKg, fPd, iEx, fKg, prevKey, round, roundKey); // generate the round key for the given round
	RD Round(clk, iRd, iEx, iXr, iAr, iSb, iSp, fRd, fEx, fXr, fAr, fSb, fSp,
	round, rightReg, leftReg, roundKey, leftRd, rightRd, xoro, EP, SB, SP);
	FP FinalPermutation(clk, iFp, fFp, {rightReg, leftReg}, out);
	
	always @(posedge clk) begin
		if (fIp) begin
			leftReg <= leftIp;
			rightReg <= rightIp;
			ic <= {leftIp, rightIp};
		end else if (fRd) begin
			leftReg <= leftRd;
			rightReg <= rightRd;
			rD <= {leftRd, rightRd};
		end
	end
	
endmodule