import board
import busio
import digitalio
from digitalio import DigitalInOut
import time
import gc
import adafruit_bme280
from adafruit_onewire.bus import OneWireBus
ow_bus = OneWireBus(board.A5)

devices = ow_bus.scan()
for device in devices:
    print("ROM = {} \tFamily = 0x{:02x}".format([hex(i) for i in device.rom], device.family_code))

import adafruit_ds18x20
ds18b20 = adafruit_ds18x20.DS18X20(ow_bus, devices[0])

# Get Wifi and FarmOS details
try:
    from secrets import secrets
except ImportError:
    print("WiFi secrets are kept in secrets.py, please add them there!")
    raise

WIFI_ESSID=secrets['ssid']
WIFI_PASS=secrets['password']
farmos_pubkey=secrets['farmos_pubkey']
farmos_privkey=secrets['farmos_privkey']

base_url= "https://edgecollective.farmos.net/farm/sensor/listener/"

JSON_POST_URL = base_url+farmos_pubkey+"?private_key="+farmos_privkey

# esp32

import adafruit_esp32spi.adafruit_esp32spi_socket as socket
from adafruit_esp32spi import adafruit_esp32spi
import adafruit_requests as requests


esp32_cs = DigitalInOut(board.D12)
esp32_ready = DigitalInOut(board.D11)
esp32_reset = DigitalInOut(board.D10)

esp_spi = busio.SPI(board.SCK, board.MOSI, board.MISO)
esp = adafruit_esp32spi.ESP_SPIcontrol(esp_spi, esp32_cs, esp32_ready, esp32_reset)

led = digitalio.DigitalInOut(board.D13)
led.direction = digitalio.Direction.OUTPUT

def blink(delay,num_times):
    for i in range(num_times):
        led.value=True
        time.sleep(delay)
        led.value=False
        time.sleep(delay)


def connect(essid,password): # note that these are arguments are b'essid' and b'password'
    print("Connecting to AP...")
    while not esp.is_connected:
        try:
            esp.connect_AP(essid, password)
        except RuntimeError as e:
            print("could not connect to AP, retrying: ",e)
            continue
    print("Connected to", str(esp.ssid, 'utf-8'), "\tRSSI:", esp.rssi)

    # Initialize a requests object with a socket and esp32spi interface
    requests.set_socket(socket, esp)

# main loop

i2c = busio.I2C(board.SCL, board.SDA)
bme280 = adafruit_bme280.Adafruit_BME280_I2C(i2c)

bme280.sea_level_pressure = 1013.25


while True:

    success = 1

    try:
        gc.collect()

        ambient_temp=bme280.temperature
        humidity = bme280.humidity
        pressure = bme280.pressure
        probe_temp = float(ds18b20.temperature)


        json_data = {"ambient_temp" : ambient_temp,"humidity" : humidity, "pressure" : pressure,"probe_temp":probe_temp}

        print(json_data)

        print("Posting to ",JSON_POST_URL)

        connect(WIFI_ESSID,WIFI_PASS)

        response = requests.post(JSON_POST_URL, json=json_data)
        #print(response.content)

        response.close()

        print("Done. Sleeping for 90 sec")
    
    except Exception as e:
        print("error: "+str(e))
        success = 0

    if (success == 0):
        time.sleep(10)
        blink(.1,5)
    if (success == 1):
        blink(1,2)
        time.sleep(90)