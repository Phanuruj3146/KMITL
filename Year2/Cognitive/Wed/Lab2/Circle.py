import numpy as np
import cv2

circle = np.zeros((300, 300, 3), dtype = "uint8")
radius = 150

for i in range(6):
    cv2.circle(circle, (150, 150), radius, (255, 255, 255), 1)
    cv2.imshow("Circle", circle)
    radius -= 25
cv2.waitKey(0) 