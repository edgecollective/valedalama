import board
import busio
import digitalio
import time
import adafruit_rfm9x

from analogio import AnalogIn

uart = busio.UART(board.TX, board.RX, baudrate=1200)

dec_switch = digitalio.DigitalInOut(board.D7)
dec_switch.direction=digitalio.Direction.OUTPUT
dec_switch.value=False

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
done = digitalio.DigitalInOut(board.D10)
done.direction = digitalio.Direction.OUTPUT

batt_pin = AnalogIn(board.A0)

vegetron_pin = AnalogIn(board.A1)


while True:


    # battery voltage
    batt_voltage = 2*float(get_voltage(batt_pin))

    # vegetronix voltage
    vegetron_voltage = float(get_voltage(vegetron_pin))


    # dummy values
    e_raw = 0.0
    ec_raw = 0.0

    t_raw = 0.0

    data = uart.read(32)

    dec_switch.value=True
    data=uart.read(32)
    if data is not None:
        print(data)
        data_string=''.join([chr(b) for b in data])
        raw_string=data_string.split(' ')
        print(raw_string)
        # dielectric
        e_raw=''.join(ch for ch in raw_string[0] if ch.isdigit())

        # electrical conductivity
        ec_raw=''.join(ch for ch in raw_string[1] if ch.isdigit())

        # temperature
        t_raw=''.join(ch for ch in raw_string[2] if ch.isdigit())

        

    else:
        print("None")

    send_str=str(batt_voltage)+","+str(vegetron_voltage)+","+str(e_raw)+","+str(ec_raw)+","+str(t_raw)
    print(send_str)

    rfm9x.send(send_str)
    time.sleep(2)
    dec_switch.value=False

    done.value = False
    done.value=True

    time.sleep(90)

