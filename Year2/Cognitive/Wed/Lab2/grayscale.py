import cv2
import numpy as np

image = cv2.imread("Cognitive\Wed\Lab2\Week2_Images\Cat03.jpg")
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
cv2.imshow("Original", gray)

cv2.waitKey(0) 