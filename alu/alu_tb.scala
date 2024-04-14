import alu._

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class alu_tb extends AnyFlatSpec with ChiselScalatestTester {
    "DUT" should "pass" in {
        test(new alu).withAnnotations(Seq(WriteVcdAnnotation)) 
        {
            dut =>
            // begin stimulus 
            // Test Addition
            dut.io.in0.poke(2.U)
            dut.io.in1.poke(3.U)
            dut.io.op.poke(0.U)
            dut.clock.step()
            dut.io.result.expect(5.U)

            // Test Subtraction
            dut.io.in0.poke(7.U)
            dut.io.in1.poke(3.U)
            dut.io.op.poke(1.U)
            dut.clock.step()
            dut.io.result.expect(4.U)

            // Test ANDing
            dut.io.in0.poke("b1111_0101".U)
            dut.io.in1.poke("b1010_1010".U)
            dut.io.op.poke(2.U)
            dut.clock.step()
            dut.io.result.expect("b1010_0000".U)

            // Test ORing
            dut.io.in0.poke("b1111_0101".U)
            dut.io.in1.poke("b1010_1010".U)
            dut.io.op.poke(3.U)
            dut.clock.step()
            dut.io.result.expect("b1111_1111".U)
        }
    }
}