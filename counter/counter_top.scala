import adder_component._
import register_component._
import chisel3._
import chisel3.util._

class counter_top extends Module {
    val io = IO(new Bundle {
        val count = Output(UInt(8.W)) // counter value
    })
    // instantiate the components
    val add = Module(new adder()) // create an object from the adder class
    val reg = Module(new register())

    // connect the register 
    val counter = reg.io.Q
    io.count := counter
    add.io.b := counter

    // connect the adder
    add.io.a := 1.U

    // get the adder result
    val adder_result = add.io.y
    val selected_val = Mux(counter === 9.U, 0.U, adder_result)
    reg.io.D := selected_val
}

object genVerilogCode extends App {
  println("Generating the Top Module hardware")
  emitVerilog(new counter_top(), Array("--target-dir", "generated"))
}