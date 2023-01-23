import cv2

image = cv2.imread("Week1_Images/sunset_image.png")
overlay = image.copy()

# corner = image[0:100, 0:100]
# cv2.imshow('Corner', corner)

cv2.rectangle(overlay, (386,0), (772, 290), (95, 0, 0), -1)
cv2.rectangle(overlay, (0,290), (386, 580), (0, 95, 0), -1)
cv2.rectangle(overlay, (386,290), (772, 580), (0, 0, 95), -1)
alpha = 0.6
# image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
final = cv2.addWeighted(overlay, alpha, image, 1 - alpha, 0, 0.0)

image[0:290, 0:386] = (0, 255, 0)
cv2.imshow('image', final)

cv2.waitKey(0)