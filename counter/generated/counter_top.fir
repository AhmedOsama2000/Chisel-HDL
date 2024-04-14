circuit counter_top :
  module adder :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<8>, flip b : UInt<8>, y : UInt<8>}

    node _io_y_T = add(io.a, io.b) @[adder.scala 12:18]
    node _io_y_T_1 = tail(_io_y_T, 1) @[adder.scala 12:18]
    io.y <= _io_y_T_1 @[adder.scala 12:10]

  module register :
    input clock : Clock
    input reset : Reset
    output io : { flip D : UInt<8>, Q : UInt<8>}

    reg reg_val : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[register.scala 12:26]
    reg_val <= io.D @[register.scala 13:13]
    io.Q <= reg_val @[register.scala 14:13]

  module counter_top :
    input clock : Clock
    input reset : UInt<1>
    output io : { count : UInt<8>}

    inst add of adder @[counter_top.scala 11:21]
    add.clock <= clock
    add.reset <= reset
    inst reg of register @[counter_top.scala 12:21]
    reg.clock <= clock
    reg.reset <= reset
    io.count <= reg.io.Q @[counter_top.scala 16:14]
    add.io.b <= reg.io.Q @[counter_top.scala 17:14]
    add.io.a <= UInt<1>("h1") @[counter_top.scala 20:14]
    node _selected_val_T = eq(reg.io.Q, UInt<4>("h9")) @[counter_top.scala 24:36]
    node selected_val = mux(_selected_val_T, UInt<1>("h0"), add.io.y) @[counter_top.scala 24:27]
    reg.io.D <= selected_val @[counter_top.scala 25:14]

