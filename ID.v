module ID(instr,clk,RdData1,RdData2,ExtSig)begin
  input clk;
  input [31:0];
  output [31:0] RdData1,RdData1,ExtSig;
  reg [5:0] op;
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [4:0] shamt;
	reg [5:0] funct;
	reg [15:0] imm;
	reg [25:0] target;
	reg RegDst, RegWrite;
	reg [4:0] RegA, RegB;
	reg [15:0] Imm;
	reg [25:0] Target;

  always@(posedge clk)begin
    decoder d1(instr,  op, rs, rt, rd, shamt, funct, imm, target, RegA, RegB, Imm,RegDst, RegWrite,Target);
    register_file r1(clk,rs,r1_data,rt,r2_data,wr_addr,wr_data,RegWrite);
    multiplexer m1(rs,rt,RegWrite,wr_addr);
    sign_extender s1(Imm,ExtSig);
  end
end