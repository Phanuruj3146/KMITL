import serial
from datetime import datetime
import time
import keyboard
SampleTime = '500'
distance_list = [0]
time_list = [0]
i = 0

with serial. Serial('COM4',9600) as serArd:
    print(f"The Arduino board is connect through {serArd.port}")
    time. sleep(2)
    serArd.reset_input_buffer()
    if (serArd.writable()):
        serArd.write(SampleTime.encode())
        print(serArd.readline().decode().rstrip())
    while not keyboard.is_pressed('q'):
        if (serArd.inWaiting() > 0):
            #print(serArd.readline())
            rec_time = datetime.now().strftime('%H:%M: %S.%f')
            time_list.append(float(rec_time[8:]))
            i += 1
            myData = serArd.readline().decode().rstrip()
            try:
                myData = float(myData)
                distance = myData*178*(10**-4)
                distance_list.append(float(distance))
                if distance < 3:
                    print(f"raw data at {rec_time} : clear")
                else:
                    # print(f"raw data at {rec_time} : {myData*178*(10**-4)} cm")
                    time_change = time_list[i] - time_list[i -1]
                    dis_change = distance_list[i] - distance_list[i - 1]
                    if dis_change > 1:
                        print("V = ", dis_change/abs(time_change), "cm/s in the backwards direction")
                    if dis_change < -1:
                        print("V = ", abs(dis_change) / abs(time_change), "cm/s in the forwards direction")
                    if dis_change == 0:
                        print("V = ", 0, "cm/s the object didn't move")

            except:
                print("invalid")