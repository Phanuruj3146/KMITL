
import cv2

image = cv2.imread("Cognitive\\Wed\\Lab4\\Coin.png", 0)

image_blur = cv2.GaussianBlur(image, (5, 5), 0)
image_canny = cv2.Canny(image_blur, 100, 200)
cv2.imshow("Blurred", image_blur)
cv2.imshow("Canny", image_canny)
contour, hierarchy = cv2.findContours(image_canny, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
cv2.drawContours(image, contour, -1, (255, 255, 0), 2)
print("amount of coin: ", len(contour))
cv2.imshow("contoured", image)
cv2.waitKey(0)