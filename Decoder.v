module Decoder(instr, clk, rest);

	input clk;
	input rest;
	input instr [31:0];

	output op [5:0];
	output rs [4:0];
	output rt [4:0];
	output rd [4:0];
	output shamt [4:0];
	output funct [5:0];
	output imm [15:0];
	output tardet [25:0];

	wire RegDst, RegWrite;
	wire [4:0] RegA, RegB;
	wire [15:0] Imm;
	wire [26;0] Target;
	wire [31:0] Instr;

	initial 
	begin
		op = 0;
		rs = 0;
		rt = 0;
		rd = 0;
		shamt = 0;
		funct = 0;
		imm = 0;
		target = 0;
	end

	always @ (instr)
	begin
		op = instr[31:26]
		rs = instr[25:21];
		rt = instr[20:14];
		rd = instr[15:11];
		shamt = instr[10:6];
		funct = instr[5:0];
		imm = instr[15:0];
		target = instr[25:0];

		case(op)
		// R
			6'b000000:
				RegDst = 1;
				RegDst = 1;

				rs = instr[25:21];
				rt = instr[20:14];
				rd = instr[15:11];
				shamt = instr[10:6];
				funct = instr[5:0]

				if (funct = 100001) // add
					RegA = rs, Regb = rt;
				if (funct = 100000) // addu
					RegA = rs, Regb = rt;
				if (funct = 100100) // and
					RegA = rs, Regb = rt;
				if (funct = 001101) // break
					RegA = b'00000, Regb = b'00000;
				if (funct = 011010) // div
					RegA = rs, Regb = rt;
				if (funct = 011011) // divu	
					RegA = rs, Regb = rt;
				if (funct = 001001) // jalr
					RegA = rs, Regb = b'00000;
				if (funct = 001000) // jr
					RegA = rs, Regb = b'00000;
				if (funct = 010000) // mfhi
					RegA = b'00000, Regb = b'00000;
				if (funct = 010010) // mflo
					RegA = b'00000, Regb = b'00000;
				if (funct = 010001) // mthi
					RegA = rs, Regb = b'00000;
				if (funct = 010011) // mtlo
					RegA = rs, Regb = b'00000;
				if (funct = 011000) // mult
					RegA = rs, Regb = rt;
				if (funct = 011000) // multu
					RegA = rs, Regb = rt;
				if (funct = 100111) // nor
					RegA = rs, Regb = rt;
				if (funct = 100101) // or
					RegA = rs, Regb = rt;
				if (funct = 000000) // sll
					RegA = b'00000, Regb = rt;
				if (funct = 000100) // sllv
					RegA = rt, Regb = rs;
				if (funct = 101010) // slt
					RegA = rs, Regb = rt;
				if (funct = 101011) // sltu
					RegA = rs, Regb = rt;
				if (funct = 000011) // sra
					RegA = b'00000, Regb = rt;
				if (funct = 000111) // srav
					RegA = rs, Regb = rt;
				if (funct = 000010) // srl
					RegA = b'00000, Regb = rt;
				if (funct = 000110) // srlv
					RegA = rt, Regb = rs;
				if (funct = 100010) // sub
					RegA = rs, Regb = rt;
				if (funct = 100011) // subu
					RegA = rs, Regb = rt;
				if (funct = 001100) // syscall
					RegA = b'00000, Regb = b'00000;
				if (funct = 100110) // xor
					RegA = rs, Regb = rt;
				end
		//I
			6'001000: RegA = rs, Regb = rt, Imm = imm;// addi
			6'001001: RegA = rs, Regb = rt, Imm = imm;// addiu
			6'001100: RegA = rs, Regb = rt, Imm = imm;// andi
			6'000100: RegA = rs, Regb = rt, Imm = imm;// beq

			6'000001: RegA = rs, Regb = b'00001, Imm = imm;// bgez
			6'000111: RegA = rs, Regb = b'00000, Imm = imm;// bgtz
			6'000110: RegA = rs, Regb = b'00000, Imm = imm;// blez
			6'000001: RegA = rs, Regb = b'00000, Imm = imm;// bltz

			6'000101: RegA = rt, Regb = rt, Imm = imm;// bne
			6'100000: RegA = rs, Regb = rt, Imm = imm;// lb
			6'100100: RegA = rs, Regb = rt, Imm = imm;// lbu
			6'100001: RegA = rs, Regb = rt, Imm = imm;// lh
			6'100101: RegA = rs, Regb = rt, Imm = imm;// lhu
			6'001111: RegA = rs, Regb = rt, Imm = imm;// lui
			6'100011: RegA = rs, Regb = rt, Imm = imm;// lw
			6'110001: RegA = rs, Regb = rt, Imm = imm;// lwcl
			6'001101: RegA = rs, Regb = rt, Imm = imm;// ori
			6'101000: RegA = rs, Regb = rt, Imm = imm;// sb
			6'001010: RegA = rs, Regb = rt, Imm = imm;// slti
			6'001011: RegA = rs, Regb = rt, Imm = imm;// sltiu
			6'101001: RegA = rs, Regb = rt, Imm = imm;// sh
			6'101011: RegA = rs, Regb = rt, Imm = imm;// sw
			6'111001: RegA = rs, Regb = rt, Imm = imm;// swcl
			6'001110: RegA = rs, Regb = rt, Imm = imm;// xori

		//J
			6'000010: Target = target;// j
			6'000011: Target = target;// jal

			defualt: RegA = b'00000, Regb = b'00000, Imm = h'00, Target = b'00000000000000000000000000;
		endcase
	end
endmodule







