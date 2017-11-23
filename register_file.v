module register_file(
  clk,
  r1_addr,
  r1_data,
  r2_addr,
  r2_data,
  wr_addr,
  wr_data,
  reg_write
  );

  input clk;
  input [4:0]  r1_addr;
  input [4:0]  r2_addr;
  input [4:0]  wr_addr;
  input [31:0] wr_data;
  input reg_write;

  output [31:0] r1_data;
  output [31:0] r2_data;

  reg [31:0] reg_file [31:0];

  assign r1_data = reg_file[r1_addr];
  assign r2_data = reg_file[r2_addr];

  integer i;

  initial
  begin
    for(i = 0; i < 32; i = i+1)
      begin
        reg_file[i] = 0;
      end
  end

  always @(posedge clk)
    begin
      if (reg_write) begin
        reg_file[wr_addr] <= wr_data;
      end
    end

endmodule
