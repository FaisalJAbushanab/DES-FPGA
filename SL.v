//module SL(
//  input wire [27:0] in,
//  input wire [1:0] shiftCount,
//  output wire [27:0] out
//);
//
//  reg [27:0] shiftRegA;
//
//  always @(in)
//  begin
//    shiftRegA = (in << shiftCount) | (in >> (28-shiftCount));
//  end
//
//  assign out = shiftRegA;
//
//endmodule