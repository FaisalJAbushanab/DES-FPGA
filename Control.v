
module Control(
	 output reg iAr, ip, iFp, iKg, iRd, iEx, iRx, iSb, iSp, done,
	 input clk, start, reset, 
			 fAr, fIp, fPd, fKg, fRd, fEx, fXr, fSb, fSp, fFp,
	 output reg [4:0] round,
	 output reg [3:0] state
    );

	parameter [3:0] S0 = 4'b0000;  	// Wait: wait for st (st is 1 for one clock cycle)
	parameter [3:0] S1 = 4'b0001; 		// initial permutation and parity drop	
	parameter [3:0] S2 = 4'b0010;  	// generate subKey (left shift)
	parameter [3:0] S3 = 4'b0011;		// compress subkey 48-bit
	parameter [3:0] S4 = 4'b0100;		// round function (expansion)
	parameter [3:0] S5 = 4'b0101;		// round function (s-box)
	parameter [3:0] S6 = 4'b0110;		// round function (Straight p-box)
	parameter [3:0] S7 = 4'b0111;		// round function (end of round)
	parameter [3:0] S8 = 4'b1000;		// final permutation
	parameter [3:0] S9 = 4'b1001;
	
	reg [3:0] nextState;
//	initial begin
//		round <= 0;
//	end
//	always @(posedge clk) begin
//		case (state)
//		S0: round <=1;
//		S7: if (round < 16 && fRd) round <= round + 1;
//		endcase
//	end
	
	always @(negedge clk) begin
		if (reset == 1'b0)  // Active low reset
			state <= S0;
		else 
			state <= nextState;
	end

	// set next state 
	always @(posedge clk) begin
		case(state)
			// ideal state
			S0: begin
				 round <=1;
				 if(start & ~ done) nextState <= S1; 
				 else   nextState <= S0;
				 end
			// initialize Sbox Arrays
			S1: begin if(fAr ) nextState <= S2;
						 else nextState <= S1;
				 end
			S2: begin if(fIp && fPd) nextState <= S3;
				 else nextState <= S2;
				 end
			// key generation: 16 subkeys
			S3: begin if(fKg) nextState <= S4;
				 else nextState <= S3;
				 end
			// key generation (compression)
//			S3: begin if(fKg) nextState = S4;
//				 else nextState = S3;
//				 end
			// round expation box
			S4: begin if (fEx) nextState <= S5;
				 else nextState <= S4;
				 end
			S5: begin if (fXr) nextState = S6;
				 else nextState = S5;
				 end
			// round s-box 
			S6: begin if (fSb) nextState <= S7;
				 else nextState <= S6;
				 end
			// round Straigt permutation
			S7: begin if (fSp) nextState <= S8;
				 else nextState <= S7;
				 end
			// end of round
			S8: begin if (fRd) begin
					if (round < 16) begin
						round <= round + 1;
						nextState <= S4;
					end else nextState <= S9;
				 end else nextState <= S8;
				end
			// final permutation
			S9: begin 
					if (fFp) begin
						nextState = S0;
					end
					else nextState = S9;
				 end
				 
		endcase
	end
	
		// Generate contro signals
	always @(posedge clk) begin
//	ip, iFp, iKg, iRdW
		iAr <= 1'b0;
		ip <= 1'b0;
		iFp <= 1'b0;
		iKg <= 1'b0;
		iRd <= 1'b0;
		iEx <= 1'b0;
		iRx <= 1'b0;
		iSb <= 1'b0;
		iSp <= 1'b0;
		done = 1'b0;
	 case(state) 
		S0: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iRx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
			done <= 1'b0;
		end
		S1: begin
			iAr <= 1'b1;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iRx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
		end
		S2: begin
			iAr <= 1'b0;
			ip <= 1'b1;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iRx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
		end
		S3: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b1;
			iRd <= 1'b0;
			iEx <= 1'b1;
			iRx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
		end
		S4: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b1;
			iRx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
		end
		S5: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iRx <= 1'b1;
			iSb <= 1'b1;
			iSp <= 1'b0;
		end
		S6: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iRx <= 1'b0;
			iSb <= 1'b1;
			iSp <= 1'b0;
		end
		S7: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b1;
		end
		S8: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b0;
			iKg <= 1'b0;
			iRd <= 1'b1;
			iEx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
			done <= 1'b0;
		end
		S9: begin
			iAr <= 1'b0;
			ip <= 1'b0;
			iFp <= 1'b1;
			iKg <= 1'b0;
			iRd <= 1'b0;
			iEx <= 1'b0;
			iSb <= 1'b0;
			iSp <= 1'b0;
			done <= 1'b1;
		end
	 endcase
	end
	
endmodule