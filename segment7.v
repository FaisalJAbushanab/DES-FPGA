module segment7(
     //Declare inputs,outputs and internal variables.
     input [4:0] bcd, bcd2, bcd3,
	  input psh,
     output reg d0, d1, d2, d3, d4, d5, d6
    );
	 
	parameter firstThird = 2'b00;
	parameter secondThird = 2'b01;
	parameter lastThird = 2'b10;
	reg [1:0] mode = firstThird;
	always @(posedge psh) begin
		if(mode == lastThird) mode <= firstThird;
		else mode <= mode +1; 
	end
	//always block for converting bcd digit into 7 segment format
    always @(bcd)
    begin
		if(mode == firstThird) begin
        case (bcd) //case statement
            0 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000001;
            1 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b1001111;
            2 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0010010;
            3 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000110;
            4 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b1001100;
            5 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0100100;
            6 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0100000;
            7 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0001111;
            8 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000000;
            9 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000100;
				10 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0001000;
				11 : {d0, d1, d2, d3, d4, d5, d6} = 7'b1100000;
				12 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0110001;
				13 : {d0, d1, d2, d3, d4, d5, d6} = 7'b1000010;
				14 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0110000;
				15 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0111000;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : {d0, d1, d2, d3, d4, d5, d6} = 7'b1111111; 
        endcase
		end else if(mode == secondThird) begin
			case (bcd2) //case statement
            0 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000001;
            1 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b1001111;
            2 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0010010;
            3 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000110;
            4 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b1001100;
            5 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0100100;
            6 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0100000;
            7 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0001111;
            8 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000000;
            9 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000100;
				10 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0001000;
				11 : {d0, d1, d2, d3, d4, d5, d6} = 7'b1100000;
				12 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0110001;
				13 : {d0, d1, d2, d3, d4, d5, d6} = 7'b1000010;
				14 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0110000;
				15 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0111000;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : {d0, d1, d2, d3, d4, d5, d6} = 7'b1111111; 
        endcase
		 end else begin
			case (bcd3) //case statement
            0 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000001;
            1 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b1001111;
            2 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0010010;
            3 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000110;
            4 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b1001100;
            5 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0100100;
            6 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0100000;
            7 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0001111;
            8 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000000;
            9 : {d0, d1, d2, d3, d4, d5, d6}  = 7'b0000100;
				10 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0001000;
				11 : {d0, d1, d2, d3, d4, d5, d6} = 7'b1100000;
				12 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0110001;
				13 : {d0, d1, d2, d3, d4, d5, d6} = 7'b1000010;
				14 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0110000;
				15 : {d0, d1, d2, d3, d4, d5, d6} = 7'b0111000;
            //switch off 7 segment character when the bcd digit is not a decimal number.
            default : {d0, d1, d2, d3, d4, d5, d6} = 7'b1111111; 
			endcase
		 end
    end
    
endmodule
