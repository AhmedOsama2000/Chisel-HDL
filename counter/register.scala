package register_component

import chisel3._
import chisel3.util._

class register extends Module {
    val io = IO(new Bundle {
        val D = Input(UInt(8.W))
        val Q = Output(UInt(8.W))
    })
    // initialize the rgister when reset
    val reg_val = RegInit(0.U)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    reg_val := io.D
    io.Q    := reg_val
}