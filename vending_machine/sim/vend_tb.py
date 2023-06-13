import cocotb
from cocotb.triggers import Timer
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ReadWrite


@cocotb.test()
async def vend_tb(dut):
  #set clock
  cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

  # initial values for dut
  dut.button_pc.value       = 0
  dut.button_hc.value       = 0
  dut.button_cc.value       = 0
  dut.token_in.value        = 0
  dut.dispense_done.value   = 0

  # reset DUT
  dut.reset.value = 1
  for i in range(3):
    await RisingEdge(dut.clk)
  dut.reset.value = 0
  for i in range(3):
    await RisingEdge(dut.clk)



  # input
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk) 

  # input
  dut.button_pc.value        = 1
  await RisingEdge(dut.clk)
  dut.button_pc.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk)

  # input
  dut.dispense_done.value      = 1
  await RisingEdge(dut.clk)
  dut.dispense_done.value      = 0
  await RisingEdge(dut.clk)

  for i in range(50):
    await RisingEdge(dut.clk)



  # input
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk) 

  # input
  dut.button_hc.value        = 1
  await RisingEdge(dut.clk)
  dut.button_hc.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk)

  # input
  dut.dispense_done.value      = 1
  await RisingEdge(dut.clk)
  dut.dispense_done.value      = 0
  await RisingEdge(dut.clk)

  for i in range(50):
    await RisingEdge(dut.clk)



  # input
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk) 

  # input
  dut.button_cc.value        = 1
  await RisingEdge(dut.clk)
  dut.button_cc.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk)

  # input
  dut.dispense_done.value      = 1
  await RisingEdge(dut.clk)
  dut.dispense_done.value      = 0
  await RisingEdge(dut.clk)

  for i in range(50):
    await RisingEdge(dut.clk)



  # input
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk) 

  # input
  dut.button_pc.value        = 1
  await RisingEdge(dut.clk)
  dut.button_pc.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk)

  # input
  dut.token_in.value      = 1
  await RisingEdge(dut.clk)
  dut.token_in.value      = 0
  await RisingEdge(dut.clk)
  dut.token_in.value      = 1
  await RisingEdge(dut.clk)
  dut.token_in.value      = 0
  await RisingEdge(dut.clk)
  dut.token_in.value      = 1
  await RisingEdge(dut.clk)
  dut.token_in.value      = 0
  await RisingEdge(dut.clk)

  # input
  dut.dispense_done.value      = 1
  await RisingEdge(dut.clk)
  dut.dispense_done.value      = 0
  await RisingEdge(dut.clk)

  for i in range(50):
    await RisingEdge(dut.clk)



  # input
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)
  dut.token_in.value        = 1
  await RisingEdge(dut.clk)
  dut.token_in.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk) 

  # input
  dut.button_pc.value        = 1
  await RisingEdge(dut.clk)
  dut.button_pc.value        = 0
  await RisingEdge(dut.clk)

  for i in range(10):
    await RisingEdge(dut.clk)

  # input
  dut.dispense_done.value      = 1
  await RisingEdge(dut.clk)
  dut.dispense_done.value      = 0
  await RisingEdge(dut.clk)

  for i in range(50):
    await RisingEdge(dut.clk)
    