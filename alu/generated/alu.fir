circuit alu :
  module alu :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in0 : UInt<8>, flip in1 : UInt<8>, flip op : UInt<2>, result : UInt<8>}

    io.result <= UInt<1>("h0") @[alu.scala 15:15]
    node _T = eq(UInt<1>("h0"), io.op) @[alu.scala 18:19]
    when _T : @[alu.scala 18:19]
      node _io_result_T = add(io.in0, io.in1) @[alu.scala 20:33]
      node _io_result_T_1 = tail(_io_result_T, 1) @[alu.scala 20:33]
      io.result <= _io_result_T_1 @[alu.scala 20:23]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.op) @[alu.scala 18:19]
      when _T_1 : @[alu.scala 18:19]
        node _io_result_T_2 = sub(io.in0, io.in1) @[alu.scala 23:33]
        node _io_result_T_3 = tail(_io_result_T_2, 1) @[alu.scala 23:33]
        io.result <= _io_result_T_3 @[alu.scala 23:23]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.op) @[alu.scala 18:19]
        when _T_2 : @[alu.scala 18:19]
          node _io_result_T_4 = and(io.in0, io.in1) @[alu.scala 26:33]
          io.result <= _io_result_T_4 @[alu.scala 26:23]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.op) @[alu.scala 18:19]
          when _T_3 : @[alu.scala 18:19]
            node _io_result_T_5 = or(io.in0, io.in1) @[alu.scala 29:33]
            io.result <= _io_result_T_5 @[alu.scala 29:23]


