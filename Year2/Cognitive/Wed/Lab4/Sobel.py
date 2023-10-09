import numpy as np
import cv2

def sobel_filter(img):
    kernel_x = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]])
    kernel_y = np.array([[-1, -2, -1], [0, 0, 0], [1, 2, 1]])
    padded_img = np.pad(img, ((1, 1), (1, 1)), 'constant')
    
    height, width = padded_img.shape
    gradient = np.zeros_like(img)
    
    for y in range(1, height - 1):
        for x in range(1, width - 1):
            gradient_x = (kernel_x * padded_img[y-1:y+2, x-1:x+2]).sum()
            gradient_y = (kernel_y * padded_img[y-1:y+2, x-1:x+2]).sum()
            
            gradient[y-1, x-1] = np.sqrt(gradient_x**2 + gradient_y**2)
    
    return gradient

img = cv2.imread("Cognitive\\Wed\\Lab4\\Coin.png", cv2.IMREAD_GRAYSCALE)
gradient = sobel_filter(img)
cv2.imshow('image', gradient)
cv2.waitKey()
cv2.destroyAllWindows()