import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_pwm(dut):
    dut._log.info("Starting PWM Test")

    # Тактовый сигнал
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Инициализация и сброс
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    # Проверка работы при 50% заполнения (128)
    dut.ui_in.value = 128
    await ClockCycles(dut.clk, 300)

    dut._log.info("Test finished successfully!")
