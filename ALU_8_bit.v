`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Manish
// Create Date: 05.06.2026 12:12:50
// Design Name:  8 bit ALU
// Module Name: ALU_8_bit
// Project Name: 8 bit ALU
//////////////////////////////////////////////////////////////////////////////////

module ALU_8_bit( Input_A, Input_B, OpCode, OutALU, COut);

input [7:0] Input_A, Input_B;
input [2:0] OpCode;
output reg[15:0] OutALU;
output reg COut;

parameter Addition = 3'b000, 
          Subtraction = 3'b001, 
          Multiplication = 3'b010, 
          Left_Shift = 3'b011, 
          Right_Shift = 3'b100, 
          Logical_AND = 3'b101, 
          Logical_OR = 3'b110, 
          Logical_XOR = 3'b111;

always@ (*) begin
OutALU = 16'b0;
COut = 1'b0;
  
case( OpCode )
  
   Addition:
   begin
   {COut, OutALU [7:0]} = Input_A + Input_B;
   OutALU [15:8] = 8'b0;
   end
  
   Subtraction:
   begin
   {COut, OutALU [7:0]} = Input_A - Input_B;
   OutALU [15:8] = 8'b0;
   end
   
   Multiplication:
   begin
   OutALU = Input_A * Input_B;
   COut = 1'b0;
   end
   
   Left_Shift:
   begin
   OutALU = Input_A << Input_B;
   COut = 1'b0;
   end
   
   Right_Shift:
   begin
   OutALU = Input_A >> Input_B;
   COut = 1'b0;
   end
   
   Logical_AND:
   begin
   OutALU = {8'b0,( Input_A & Input_B)};
   COut = 1'b0;
   end
   
   Logical_OR:
   begin
   OutALU = {8'b0,( Input_A | Input_B)};
   COut = 1'b0;
   end  
   
   Logical_XOR:
   begin
   OutALU = {8'b0,( Input_A ^ Input_B)};
   COut = 1'b0;
   end
   
   default:
   begin
   OutALU =16'b0;
   COut = 1'b0;
   end
   
  endcase
end  
endmodule


module ALU_8_bit_tb ;

reg [7:0]Input_A;
reg [7:0]Input_B;
reg [2:0]OpCode;
wire [15:0]OutALU;
wire COut;

ALU_8_bit uff(.Input_A(Input_A), .Input_B(Input_B), .OpCode(OpCode), .OutALU(OutALU), .COut(COut));
initial begin

Input_A = 0;
Input_B = 0;
OpCode = 3'b000;

#50;
Input_A =45;
Input_B =38;
OpCode =3'b000;

#50;
Input_A =45;
Input_B =38;
OpCode =3'b001;

#50;
Input_A =45;
Input_B =38;
OpCode =3'b110;

#50;
Input_A =45;
Input_B =38;
OpCode =3'b111;

#50;
Input_A =49;
Input_B =10;
OpCode =3'b010;

#50;
Input_A =49;
Input_B =10;
OpCode =3'b011;

#50;
Input_A =49;
Input_B =10;
OpCode =3'b100;

#50;
Input_A =49;
Input_B =10;
OpCode =3'b101;

$finish;
end
endmodule