import board
import busio
import digitalio
from digitalio import DigitalInOut
import time
import gc

import adafruit_bme280
i2c = busio.I2C(board.SCL, board.SDA)
bme280 = adafruit_bme280.Adafruit_BME280_I2C(i2c)


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

esp32_cs = DigitalInOut(board.D13)
esp32_reset = DigitalInOut(board.D12)
esp32_ready = DigitalInOut(board.D11)

esp_spi = busio.SPI(board.SCK, board.MOSI, board.MISO)
esp = adafruit_esp32spi.ESP_SPIcontrol(esp_spi, esp32_cs, esp32_ready, esp32_reset)


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

# lora

import adafruit_rfm9x

TIMEOUT=5

#lora_spi = busio.SPI(board.SCK, board.MOSI, board.MISO)


cs = digitalio.DigitalInOut(board.A5)
reset = digitalio.DigitalInOut(board.A4)
rfm9x = adafruit_rfm9x.RFM9x(esp_spi, cs, reset, 433.0)

# connect to wifi



# main loop

while True:

    gc.collect()

    g_temp = bme280.temperature
    g_humidity = bme280.humidity
    g_pressure = bme280.pressure

    print("radio waiting ...")
    packet = rfm9x.receive(timeout=TIMEOUT)

    if packet is not None:
        try:

            #connect(WIFI_ESSID,WIFI_PASS)
            pt = str(packet, 'ascii').strip()
            print("Received: ",pt)

            params=pt.split(",")
            print(params)
            
            if len(params)==5:

                battery=params[0]
                vegetronix = params[1]
                e_raw=params[2]
                ec_raw=params[3]
                temp_raw=params[4]

                # calculating temperature
                temp_raw=float(temp_raw)
                if (temp_raw > 900):
                    temp_raw = 5*(temp_raw-900)+900
                r_temp = (temp_raw-400.)/10.
                print("r_temp=",r_temp)

                # calculating the dielectric and VWC
                e=float(e_raw)/50.
                print("e=",e)
                theta=4.3*10**(-6)*e**3 - 5.5*10**(-4)*e**2+2.292*10**(-2)*e-5.3*10**(-2)
                print("theta=",theta)

                # calculating the electrical conductivity
                ec_raw = float(ec_raw)
                if (ec_raw > 700):
                    ec_raw = 5*(ec_raw - 700)+700
                ec = float(ec_raw) / 100.
                print("ec = ",ec)

                json_data = {"gateway_temp" : g_temp, "gateway_humidity": g_humidity, "gateway_pressure":g_pressure, "remote_battery": battery, "remote_soil_capacitive": vegetronix, "remote_e_raw":e_raw, "remote_ec_raw":ec_raw, "remote_temp_raw":temp_raw,
                "remote_vwc": theta, "remote_soil_ec": ec, "remote_soil_temp": r_temp}

                print("Posting to ",JSON_POST_URL)
                
                connect(WIFI_ESSID,WIFI_PASS)
                response = requests.post(JSON_POST_URL, json=json_data)
                response.close()

            else:
                print("garbled message")

            print("Done. Sleeping ... ")
            time.sleep(90)
            
        except Exception as e:
            print("error: "+str(e))



       
        