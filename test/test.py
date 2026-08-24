import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_pwm(dut):
    dut._log.info("Start PWM test")
    
    # Запуск тактового сигнала (10 МГц)
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    # Начальный сброс
    dut.rst_n.value = 0
    dut.ena.value = 1
    dut.ui_in.value = 128 # Duty cycle 50% (128/256)
    dut.uio_in.value = 0
    
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    
    # Ждем 300 тактов для работы ШИМ
    await ClockCycles(dut.clk, 300)
    dut._log.info("PWM test completed successfully")
