module RD (
	input clk, iRd, iEx, iXr, iAr, iSb, iSp,
	output reg fRd, fEx, fXr,
	output fAr,
	output reg fSb, fSp,
	input [4:0] round,
	input [31:0] rightPlain,
	input [31:0] leftPlain,
	input [47:0] rKey,
	output reg [31:0] left,
	output reg [31:0] right,
	output reg [47:0] XORout, EP,
	output reg [31:0] SB, SP
);
	wire [47:0] EPout;

	wire [31:0] SBoxOut, SPOut;
//	wire rd;
	
//	assign rd = iEx ? 1'b1 : 1'bz;
//	wire [47:0] rKey;
	reg [47:0] roundKey;
	
	// unused wires
	wire ip, fPd, fKg;
	wire [55:0] prev;
	reg [31:0] roundLeft, roundRight;
	
//	assign roundLeft = iEx? leftPlain : roundLeft;
//	assign roundRight = iEx? rightPlain: roundRight;
//	assign XORout = EPout ^ roundKey; 
//	xor #(48) xor_gate(XORout, EPout, roundKey); // xor with roundKey	

//	KG RoundKey(clk, iKg, fPd, iEx, fKg, prev, round,  rKey);
	EB ExpansionBox(clk, iEx, rightPlain, EPout); // expand 32 input to 48 bits

	SB SBox(clk, iAr, iSb, fAr, XORout, SBoxOut); // SBox to reduce the input to 32 bits again
	SP StraightPBox(SB, SPOut); // confusion box
	
		
	always @(posedge clk) begin
		if(iEx) begin
			roundLeft <= leftPlain;
			roundRight <= rightPlain;
			
			roundKey <= rKey;
			EP <= EPout;
//			XORout = roundKey ^ EP;
			fRd <= 1'b0;
			fEx <= 1'b1;
			fSb <= 1'b0;
			fSp <= 1'b0;
			fXr <= 1'b0;
		end else if (iXr) begin
			XORout <= roundKey ^ EP;
			fRd <= 1'b0;
			fEx <= 1'b0;
			fSb <= 1'b0;
			fSp <= 1'b0;
			fXr <= 1'b1;
		end else if(iSb) begin
			SB <= SBoxOut;
			fRd <= 1'b0;
			fEx <= 1'b0;
			fSb <= 1'b1;
			fSp <= 1'b0;
			fXr <= 1'b0;
		end else if(iSp) begin
			SP <= SPOut;
			fRd <= 1'b0;
			fEx <= 1'b0;
			fSb <= 1'b0;
			fSp <= 1'b1;
			fXr <= 1'b0;
		end else if(iRd) begin
			right <= roundLeft ^ SP;
			left <= roundRight;
			fRd <= 1'b1;
			fEx <= 1'b0;
			fSb <= 1'b0;
			fSp <= 1'b0;
			fXr <= 1'b0;
		end else begin
			fRd <= 1'b0;
			fEx <= 1'b0;
			fSb <= 1'b0;
			fSp <= 1'b0;
			fXr <= 1'b0;
		end
	end
endmodule
