package adder_component

import chisel3._
import chisel3.util._

class adder extends Module {
    val io = IO(new Bundle {
        val a = Input(UInt(8.W))
        val b = Input(UInt(8.W))
        val y = Output(UInt(8.W))
    })
    io.y := io.a + io.b
}

