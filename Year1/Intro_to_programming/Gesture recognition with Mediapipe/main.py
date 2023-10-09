import math
import time
import cv2
import mediapipe as mp
import numpy as np

mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_pose = mp.solutions.pose

# Angle calculating function:
def angleCal(startPoint, midPoint, endPoint):
    fAngle = math.atan2(endPoint[1] - midPoint[1], endPoint[0] - midPoint[0])
    eAngle = math.atan2(startPoint[1] - midPoint[1], startPoint[0] - midPoint[0])
    degree = abs(math.degrees(fAngle - eAngle))
    if degree > 180:
        degree = 360.0 - degree
    return degree

# For static images:
IMAGE_FILES = ["pic.jpg"]
BG_COLOR = (192, 192, 192) # gray
angleLPic = 0
angleRPic = 0
angleLLPic = 0
angleRLPic = 0
with mp_pose.Pose(
    static_image_mode=True,
    model_complexity=2,
    enable_segmentation=True,
    min_detection_confidence=0.5) as pose:
  for idx, file in enumerate(IMAGE_FILES):
    image = cv2.imread(file)
    image_height, image_width, _ = image.shape
    # Convert the BGR image to RGB before processing.
    resultsPic = pose.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))

    if not resultsPic.pose_landmarks:
      continue
    print(
        f'Nose coordinates: ('
        f'{resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.NOSE].x * image_width}, '
        f'{resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.NOSE].y * image_height})'
    )

    annotated_image = image.copy()
    # Draw segmentation on the image.
    # To improve segmentation around boundaries, consider applying a joint
    # bilateral filter to "results.segmentation_mask" with "image".
    condition = np.stack((resultsPic.segmentation_mask,) * 3, axis=-1) > 0.1
    bg_image = np.zeros(image.shape, dtype=np.uint8)
    bg_image[:] = BG_COLOR
    annotated_image = np.where(condition, annotated_image, bg_image)

    #left side angle
    lShoulder = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_SHOULDER].x * image_width,
                 resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_SHOULDER].y * image_height]
    lElbow = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ELBOW].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ELBOW].y * image_height]
    lWrist = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_WRIST].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_WRIST].y * image_height]
    angleL = angleCal(lShoulder, lElbow, lWrist)
    angleLPic = round(angleL, -1)
    print("angleL: " + str(angleLPic))

    #right side angle
    lShoulder = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_SHOULDER].x * image_width,
                 resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_SHOULDER].y * image_height]
    lElbow = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ELBOW].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ELBOW].y * image_height]
    lWrist = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_WRIST].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_WRIST].y * image_height]
    angleRPic = round(angleCal(lShoulder, lElbow, lWrist), -1)
    print("angleR: " + str(angleRPic))

    # left leg
    lShoulder = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_HIP].x * image_width,
                 resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_HIP].y * image_height]
    lElbow = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_KNEE].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_KNEE].y * image_height]
    lWrist = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ANKLE].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ANKLE].y * image_height]
    angleLLPic = round(angleCal(lShoulder, lElbow, lWrist), -1)
    print("angleLL: " + str(angleLLPic))

    # Right leg
    lShoulder = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_HIP].x * image_width,
                 resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_HIP].y * image_height]
    lElbow = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_KNEE].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_KNEE].y * image_height]
    lWrist = [resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ANKLE].x * image_width,
              resultsPic.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ANKLE].y * image_height]
    angleRLPic = round(angleCal(lShoulder, lElbow, lWrist), -1)
    print("angleRL: " + str(angleRLPic))

    # Draw pose landmarks on the image.
    #.draw_landmarks(
        #annotated_image,
        #results.pose_landmarks,
        #mp_pose.POSE_CONNECTIONS,
        #landmark_drawing_spec=mp_drawing_styles.get_default_pose_landmarks_style())
    #cv2.imwrite('/tmp/annotated_image' + str(idx) + '.png', annotated_image)
    # Plot pose world landmarks.
    #mp_drawing.plot_landmarks(
        #results.pose_world_landmarks, mp_pose.POSE_CONNECTIONS)

landmarkCoord = []

# For webcam input:
cap = cv2.VideoCapture(0)
with mp_pose.Pose(
    min_detection_confidence=0.5,
    min_tracking_confidence=0.5) as pose:
  while cap.isOpened():
    success, image = cap.read()
    if not success:
      print("Ignoring empty camera frame.")
      # If loading a video, use 'break' instead of 'continue'.
      continue

    # Flip the image horizontally for a later selfie-view display, and convert
    # the BGR image to RGB.
    image = cv2.cvtColor(cv2.flip(image, 1), cv2.COLOR_BGR2RGB)
    # To improve performance, optionally mark the image as not writeable to
    # pass by reference.
    image.flags.writeable = False
    results = pose.process(image)

    # Draw the pose annotation on the image.
    image.flags.writeable = True
    image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    mp_drawing.draw_landmarks(
        image,
        results.pose_landmarks,
        mp_pose.POSE_CONNECTIONS,
        landmark_drawing_spec=mp_drawing_styles.get_default_pose_landmarks_style())
    cv2.imshow('MediaPipe Pose', image)
    if cv2.waitKey(5) & 0xFF == 27:
      break
    #If left elbow is equal to the pic
    try:
        lShoulder = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_SHOULDER].x * image_width,
                     results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_SHOULDER].y * image_height]
        lElbow = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ELBOW].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ELBOW].y * image_height]
        lWrist = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_WRIST].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_WRIST].y * image_height]
        angleL = round(angleCal(lShoulder, lElbow, lWrist), -1)
        print("L: " + str(angleL))
    except:
        print("This doesn't work 1")

    #If right elbow is equal to the pic
    try:
        lShoulder = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_SHOULDER].x * image_width,
                     results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_SHOULDER].y * image_height]
        lElbow = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ELBOW].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ELBOW].y * image_height]
        lWrist = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_WRIST].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_WRIST].y * image_height]
        angleR = round(angleCal(lShoulder, lElbow, lWrist), -1)
        print("R: " + str(angleR))
    except:
        print("This doesn't work 2")

    #left leg
    try:
        lShoulder = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_HIP].x * image_width,
                     results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_HIP].y * image_height]
        lElbow = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_KNEE].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_KNEE].y * image_height]
        lWrist = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ANKLE].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.LEFT_ANKLE].y * image_height]
        angleLL = round(angleCal(lShoulder, lElbow, lWrist), -1)
        print("LL: " + str(angleLL))
    except:
        print("This doesn't work 3")

    # Right leg
    try:
        lShoulder = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_HIP].x * image_width,
                     results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_HIP].y * image_height]
        lElbow = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_KNEE].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_KNEE].y * image_height]
        lWrist = [results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ANKLE].x * image_width,
                  results.pose_landmarks.landmark[mp_pose.PoseLandmark.RIGHT_ANKLE].y * image_height]
        angleRL = round(angleCal(lShoulder, lElbow, lWrist), -1)
        print("RL: " + str(angleRL))
    except:
        print("This doesn't work 4")

    #If statement
    if angleL == angleLPic and angleR == angleRPic:
        if angleLL == angleLLPic and angleRL == angleRLPic:
            exit("You've done the yoga post! :)")
cap.release()