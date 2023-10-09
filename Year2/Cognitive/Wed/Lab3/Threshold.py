import cv2
import numpy as np

img = cv2.imread("C:\\Users\\ASUS\\Documents\\KMITL\\Cognitive\\Wed\\Lab3\\Week3_Images\\Coin.png", cv2.IMREAD_GRAYSCALE) 

width = img.shape[1]
height = img.shape[0]

def thresholding(max):
    for item in range(height):
        for item2 in range(width):
            if img[item][item2] > max:
                img[item][item2] = 255

            else:
                img[item][item2] = 0

thresholding(127)
cv2.imshow("threshold image", img)
cv2.waitKey(0)      

"""
the first one is the thresh to zero because from the original image we can see that the darkest part turn to black and the brighter part turn to white but the another one is 
thresh to zero INV because the darkest part of original image turn to brighter and the brighter part turn to black 
"""