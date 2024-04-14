module adder(
  input  [7:0] io_b,
  output [7:0] io_y
);
  assign io_y = 8'h1 + io_b; // @[adder.scala 12:18]
endmodule
module register(
  input        clock,
  input        reset,
  input  [7:0] io_D,
  output [7:0] io_Q
);

  reg [31:0] _RAND_0;
  reg [7:0] reg_val; // @[register.scala 12:26]
  assign io_Q = reg_val; // @[register.scala 14:13]
  always @(posedge clock) begin
    if (reset) begin // @[register.scala 12:26]
      reg_val <= 8'h0; // @[register.scala 12:26]
    end else begin
      reg_val <= io_D; // @[register.scala 13:13]
    end
  end
endmodule
module counter_top(
  input        clock,
  input        reset,
  output [7:0] io_count
);
  wire [7:0] add_io_b; // @[counter_top.scala 11:21]
  wire [7:0] add_io_y; // @[counter_top.scala 11:21]
  wire  reg__clock; // @[counter_top.scala 12:21]
  wire  reg__reset; // @[counter_top.scala 12:21]
  wire [7:0] reg__io_D; // @[counter_top.scala 12:21]
  wire [7:0] reg__io_Q; // @[counter_top.scala 12:21]
  adder add ( // @[counter_top.scala 11:21]
    .io_b(add_io_b),
    .io_y(add_io_y)
  );
  register reg_ ( // @[counter_top.scala 12:21]
    .clock(reg__clock),
    .reset(reg__reset),
    .io_D(reg__io_D),
    .io_Q(reg__io_Q)
  );
  assign io_count = reg__io_Q; // @[counter_top.scala 16:14]
  assign add_io_b = reg__io_Q; // @[counter_top.scala 17:14]
  assign reg__clock = clock;
  assign reg__reset = reset;
  assign reg__io_D = reg__io_Q == 8'h9 ? 8'h0 : add_io_y; // @[counter_top.scala 24:27]
endmodule
