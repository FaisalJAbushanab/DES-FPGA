
////module testDES;
////  reg clk;
////  reg reset;
////  reg start, isEnc;
////  reg [63:0] plaintext;
////  reg [63:0] key;
////  wire done;
////  wire [63:0] ciphertext;
////
////  DES dut (
////    .clk(clk),
////	 .isEnc(isEnc),
////    .reset(reset),
////    .start(start),
////    .plaintext(plaintext),
////    .key(key),
////    .done(done),
////    .ciphertext(ciphertext)
////  );
////
////  // Clock generation
////  always #3 clk = ~clk;
////
////  initial begin
////    clk = 0;
////    reset = 0;
////    start = 0;
////	 isEnc = 0;
//////    plaintext = 64'h0123456789ABCDEF;
//////	 plaintext =   64'h1;
////	 plaintext = 64'b0011100000101011110001000001100101001010010001111100000001010110;
////    key = 		 64'b0000000000000000000000000000000000000000000000000000000010000001;
////
////    #10 reset = 1; // Release reset
////	 #10 isEnc = 0;
////    #5 start = 1; // Start the encryption/decryption process
////    // Simulation loop
////    
////    #20000 $stop; // End simulation
////  end
////  always @(posedge done)
////	start = 0;
////endmodule
//
//

module testDES;
  
  // Inputs
  reg clk;
  reg reset;
  reg right;
  reg isEnc;
  reg psh;
  
  // Outputs
  wire d00, d01, d02, d03, d04, d05, d06;
  wire d10, d11, d12, d13, d14, d15, d16;
  wire d20, d21, d22, d23, d24, d25, d26;
  wire d30, d31, d32, d33, d34, d35, d36;
  wire d40, d41, d42, d43, d44, d45, d46;
  wire d50, d51, d52, d53, d54, d55, d56;
  wire led1, led2, led3, led4, led5, led6, led7, led8, tx;
  reg m0, m1, m2;
  // Instantiate the DES module
  DES dut (
    .CLK_50MHZ(clk),
    .reset(reset),
    .right(right),
    .isEnc(isEnc),
    .d00(d00), .d01(d01), .d02(d02), .d03(d03), .d04(d04), .d05(d05), .d06(d06),
    .d10(d10), .d11(d11), .d12(d12), .d13(d13), .d14(d14), .d15(d15), .d16(d16),
    .d20(d20), .d21(d21), .d22(d22), .d23(d23), .d24(d24), .d25(d25), .d26(d26),
    .d30(d30), .d31(d31), .d32(d32), .d33(d33), .d34(d34), .d35(d35), .d36(d36),
    .d40(d40), .d41(d41), .d42(d42), .d43(d43), .d44(d44), .d45(d45), .d46(d46),
    .d50(d50), .d51(d51), .d52(d52), .d53(d53), .d54(d54), .d55(d55), .d56(d56),
    .led1(led1), .led2(led2), .led3(led3), .led4(led4), .led5(led5), .led6(led6), .led7(led7), .led8(led8),
	 .psh(psh), .m0(m0), .m1(m1), .m2(m2), .tx(tx)
  );
  
  // Clock generation
  always #5 clk = ~clk;
  
  // Initialize inputs
  initial begin
    clk = 0;
    reset = 0;
    right = 0;
    isEnc = 0;
	 m0 =0;
	 m1 = 0;
	 m2 = 0;
    
    // Wait for a few cycles for stability
    #10;
    
    // Start the encryption process
	 reset = 1;
    isEnc = 1;
    right = 1;
    
    // Wait for a few cycles
    #10000;
	 
	 reset = 0;
    isEnc = 0;
    right = 1;
	 #10
	 reset = 1;
    isEnc = 0;
    right = 1;
	 #10000
    
    // Stop simulation
    $stop;
  end
  
endmodule

