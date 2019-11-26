import board
import busio
import digitalio
import time
import adafruit_rfm9x
import gc
import microcontroller

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


index=0

while True:
    

    time.sleep(3)

    for i in range(0,5):
        led.value=True
        time.sleep(.1)
        led.value=False
        time.sleep(.1)

    sendstr=str(microcontroller.cpu.temperature)
    print(sendstr)
    rfm9x.send(sendstr)

    index=index+1

    done.value = False
    done.value=True

