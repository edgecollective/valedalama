import board
import busio
import digitalio
import time

uart = busio.UART(board.TX, board.RX, baudrate=1200)

dec_switch = digitalio.DigitalInOut(board.D7)
dec_switch.direction=digitalio.Direction.OUTPUT
dec_switch.value=False

while True:



    data = uart.read(32)

    #dec_switch.value=True
    #data=uart.read(32)
    if data is not None:
        print(data)
    else:
        print("None")
    time.sleep(.10)