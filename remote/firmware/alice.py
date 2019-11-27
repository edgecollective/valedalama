import board
import busio
import digitalio
import time
import adafruit_rfm9x
import gc
import microcontroller
from analogio import AnalogIn

analog_in = AnalogIn(board.A1)

def get_voltage(pin):
    return (pin.value * 3.3) / 65536

# lora radio
spi = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)
cs = digitalio.DigitalInOut(board.A5)
reset = digitalio.DigitalInOut(board.A4)
rfm9x = adafruit_rfm9x.RFM9x(spi, cs, reset, 433.0)

# led
led = digitalio.DigitalInOut(board.D13)
led.direction = digitalio.Direction.OUTPUT

# done
done = digitalio.DigitalInOut(board.D7)
done.direction = digitalio.Direction.OUTPUT
#done.value = False

reading=float(get_voltage(analog_in))

sendstr=str(reading)
print(sendstr)
rfm9x.send(sendstr)

done.value = False
done.value=True

