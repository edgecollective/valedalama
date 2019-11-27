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
        traw=''.join(ch for ch in raw_string[2] if ch.isdigit())

        # calculating temperature
        traw=float(traw)
        if (traw > 900):
            traw = 5*(traw-900)+900
        temp = (traw-400.)/10.
        print("temp=",temp)

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

    else:
        print("None")
    time.sleep(2)
    dec_switch.value=False
    time.sleep(1)

