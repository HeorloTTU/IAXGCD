module GCDUnit_bhv# ( parameter W = 16) //WIDTH
(

input clk,
input  [W-1:0] operands_bits_A,
input  [W-1:0] operands_bits_B,


input [W-1:0] inA,  //INputs
input [W-1:0] inB,
input input_available,
input reset,
input result_taken

output [W-1:0] out, //outputs
output [W-1:0] result_bits_data,
output result_rdy,
);
reg [W-1:0] A, B, out, swap;  //regs
integer done;



always @(*)
begin
 done = 0;
 A = inA; B = inB; // State -> Registers

while ( !done )
begin           // Less than comparator
 if ( A < B )
  swap = A;
  A = B;
  B = swap;      // Equality comparator
 else if ( B != 0 )
   A = A - B;   //Substractor
 else
 done = 1;
end

out = A;
