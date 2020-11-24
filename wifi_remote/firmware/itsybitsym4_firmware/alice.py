import board
import busio
import digitalio
import time

spi = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)
cs = digitalio.DigitalInOut(board.D5)
reset = digitalio.DigitalInOut(board.D6)


while True:
    rfm9x.send('Hello world!')
    time.sleep(1)
