import cv2
import numpy as np

# circle = np.zeros((300, 300, 3), dtype = "uint8")
# radius = 150

# for i in range(6):
#     cv2.circle(circle, (150, 150), radius, (255, 255, 255), 1)
#     radius -= 25

image = cv2.imread("Cognitive\Wed\Lab2\Week2_Images\Cat03.jpg")

mask = np.zeros(image.shape[:2], dtype = "uint8")
(cX, cY) = (image.shape[1]//2, image.shape[0]//2)
cv2.circle(mask, (cX, cY), cX, 255, -1)

masked = cv2.bitwise_and(image, image, mask = mask)
cv2.imshow("Mask Applied to Image", masked)
cv2.waitKey(0)