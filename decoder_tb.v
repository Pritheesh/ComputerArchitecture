
module test_decoder;
	reg [5:0] opcode;
	reg [5:0] funct;
	wire [2:0] ALUCtl;
	wire MemtoReg,MemWrite,Branch,ALUsrc,RegDst,RegWrite;
	Decoder d1(opcode,funct,ALUctl,MemtoReg,MemWrite,Branch,ALUsrc,RegDst,RegWrite);

	
	initial
	begin
	   #2 opcode = 5'h0; B = 5'h1;	
	   #2 opcode = 5'b100011; B = 5'h0;
	   #2 opcode = 5'b101011; B = 5'h0;
	   #2 opcode = 5'b000100; B = 5'h0;
	   #2 opcode = 5'b001001; B = 5'h0;
	   #2 opcode = 5'b000010; B = 5'h0;		
	end

	initial $monitor($time, "ALUctl=%h opcode%h funct=%h ALUctl=%h MemtoReg=%h MemWrite=%h Branch=%h ALUsrc%h RegDst%h RegWrite%h",
			 ALUctl, opcode,funct,ALUctl,MemtoReg,MemWrite,Branch,ALUsrc,RegDst,RegWrite);
	initial #50 $stop;

endmodule

	