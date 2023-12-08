# Hand Gesture Detection


[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/145GC1wY9dAeOz6zBKy4sh7AU0_gu7Ypj?usp=sharing)
[![Google Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)](https://pranavchiku.github.io/Gesture-Detection-Application/)
[![LaTeX](https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white)](https://github.com/Pranavchiku/Gesture-Detection-Application/blob/d403c8d211a0d004daf38631c465c6b836e12a24/B20CS016_B20CS019_ES_PROJECT.pdf)
## Overview:
The project presents the development of a multiplatform application (Mobile Application, Desktop
Application and website) for hand gesture detection using deep learning models. The system can be used
to recognize and classify hand gestures captured through a camera on various platforms such as desktop,
mobile, and embedded systems. The application uses convolutional neural network (CNN) models trained
on large datasets of hand gesture images to detect and recognize a variety of gestures. The system is
designed to be fast and efficient, allowing real-time recognition of hand gestures with high accuracy.
The results show that the application can be used in a wide range of applications, including human-
computer interaction, virtual reality, and robotics. The proposed system demonstrates the potential of
deep learning techniques in creating efficient and accurate hand gesture recognition systems.
## Dataset Description
We are using Hand Gesture Recognition Database
for efficient training of various Deep learning models. It contains a total of 20,000 images and 10 labels named as palm, L, fist, moved, thumb, index,
ok, palm moved, C, down, each containing 2000
images. Hand gesture recognition database is composed by a set of near-infrared images acquired by
the Leap Motion sensor.
## Source of Dataset
[Hand Gesture Recognition Database](https://www.kaggle.com/datasets/gti-upm/leapgestrecog)
## Built using:
- [Scikit Learn: ](https://scikit-learn.org/stable/) ML Library used
- [TensorFlow Keras: ](https://www.tensorflow.org/api_docs/python/tf/keras) ML Libraries used
- [HTML: ](https://developer.mozilla.org/en-US/docs/Web/HTML) HTML documentation used
- [Javscript: ](https://developer.mozilla.org/en-US/docs/Web/JavaScript) Javscript framework used
- [Pandas: ](https://pandas.pydata.org/) Python data manipulation libraries
- [Seaborn: ](https://seaborn.pydata.org/) Data visualisation library
- [OpenCV2: ](https://pypi.org/project/opencv-python/) Image Preprocessing library
- [Flutter: ](https://docs.flutter.dev/) Flutter Documentation Used
## Pipeline:
### [1. B20CS016_B20CS019_B20EE090_GESTURE.ipynb](https://github.com/Pranavchiku/Gesture-Detection-Application/blob/d403c8d211a0d004daf38631c465c6b836e12a24/B20CS016_B20CS019_GESTURE.ipynb)
This is the main file containing EDA, preprocessing, application of various deep learning models.
- Installing libraries and dependencies
- Importing the dataset
- Exploratory Data Analysis and Visualisation
- Data Preprocessing
  - Normalisation
  - Resizing image
  - Segmentation
- Deep learning Models (CNN)
  - AutoEncoder
  - VGG 19
  - Resnet50
  - EfficientNet B3
  - U Net (For Hand Segmentation)
  - CNN Based on Research paper
  - Saving .json file and weights for deployment
## How to run:
- Run the cells in main file according to above mentioned pipeline
## How to run DesktopApp:
Step 1: \
Download or clone this repository by using the link below:
```
https://github.com/Pranavchiku/Gesture-Detection-Application.git
```
Step 2: \
Open the project in an IDE and execute the following command in console to get the required dependencies:
```
pip install requirements.txt
```
Step 3:\
Download zip of model from [here](https://drive.google.com/file/d/1-He6GaCxQ-f79ipf_JLhpb4Tf50K2tkg/view?usp=sharing), extract it and keep it in root directory of this project.

Step 4:\
Run the following command on any terminal
```
python DesktopApp.py
```
## How to Use Mobile Application:
Step 1: \
Download or clone this repository by using the link below:
```
https://github.com/Pranavchiku/Gesture-Detection-Application.git
```
Step 2:\
Reach directory of App:
```
cd Flutter_frontend/hand_gesture_detector/
```
Step 3: \
Open the project in an IDE and execute the following command in console to get the required dependencies:
```
flutter pub get
```
Step 4: \
Run the project by executing the below piece of code in console:
```
flutter run
```
If the code shows no sound null safety error, run the below code:
```
flutter run --no-sound-null-safety
```
If the code still do not run \
Step 5: 
```
flutter clean
```
Step 6: 
```
flutter upgrade
```
## Collaborators:
| Name | Year | Branch|
| ------------- | ------------- | ------------- |
| Harshita Kalani (B20CS019)  | PreFinal  | CSE |
| Pranav Goswami (B20CS016) | PreFinal  | CSE |
| Parth Mistry (B20EE090) | PreFinal  | EE |

