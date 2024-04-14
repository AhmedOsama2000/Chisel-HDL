package alu

import chisel3._
import chisel3.util._ // imported to use switch is utility

class alu extends Module {
    val io = IO(new Bundle {
        val in0    = Input(UInt(8.W))
        val in1    = Input(UInt(8.W))
        val op     = Input(UInt(2.W))
        val result = Output(UInt(8.W))
    })
    
    // some default value is needed or could through an error
    io.result := 0.U

    // calc the result based on the operation
    switch(io.op) {
        is(0.U) {
            io.result := io.in0 + io.in1
        }
        is(1.U) {
            io.result := io.in0 - io.in1
        }
        is(2.U) {
            io.result := io.in0 & io.in1
        }
        is(3.U) {
            io.result := io.in0 | io.in1
        }
    }
}

object AddMain extends App {
  println("Generating the alu hardware")
  emitVerilog(new alu(), Array("--target-dir", "generated"))
}
