module alu(
  input        clock,
  input        reset,
  input  [7:0] io_in0,
  input  [7:0] io_in1,
  input  [1:0] io_op,
  output [7:0] io_result
);
  wire [7:0] _io_result_T_1 = io_in0 + io_in1; // @[alu.scala 20:33]
  wire [7:0] _io_result_T_3 = io_in0 - io_in1; // @[alu.scala 23:33]
  wire [7:0] _io_result_T_4 = io_in0 & io_in1; // @[alu.scala 26:33]
  wire [7:0] _io_result_T_5 = io_in0 | io_in1; // @[alu.scala 29:33]
  wire [7:0] _GEN_0 = 2'h3 == io_op ? _io_result_T_5 : 8'h0; // @[alu.scala 15:15 18:19 29:23]
  wire [7:0] _GEN_1 = 2'h2 == io_op ? _io_result_T_4 : _GEN_0; // @[alu.scala 18:19 26:23]
  wire [7:0] _GEN_2 = 2'h1 == io_op ? _io_result_T_3 : _GEN_1; // @[alu.scala 18:19 23:23]
  assign io_result = 2'h0 == io_op ? _io_result_T_1 : _GEN_2; // @[alu.scala 18:19 20:23]
endmodule
