import serial
import sys
LED_flag = False
with serial.Serial('COM4', 9600 , timeout=1) as serArd:
    print(f"The Arduino board is connect through {serArd.port}")
    while True:
        try:
            con_val = input(f"Enter 1 for turn on LED1 and Enter 2 for turn on LED2 and Enter 3 for turn on Potentialmeter and 0 for turn off both of LED : ")
            while not con_val in ['0', '1', '2', '3', 'q']:
                print(f"Please enter 1 or 0 !")
                con_val = input(f"Enter 1 for turn on LED1 and Enter 2 for turn on LED2 and Enter 3 for turn on Potentialmeter and 0 for turn off both of LED : ")
            print(f'you entered {con_val}')
            if (serArd.writable() and con_val != 'q'):
                serArd.write(con_val.encode())
                myData = serArd.readline().decode()
                print(myData)

            if con_val == 'q':
                print('Program is stopped!')
                break
        
        except serial.SerialException as er:
            print(er)

        except KeyboardInterrupt:
            sys.exit(0)
