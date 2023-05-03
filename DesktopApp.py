from tflearn.layers.core import input_data,dropout,fully_connected
from tflearn.layers.conv import conv_2d,max_pool_2d
from tflearn.layers.estimator import regression
import tensorflow as tf
from keras import Input
from keras.models import Sequential,Model
from keras.layers import Conv2D,Dense,Flatten,MaxPooling2D,AveragePooling2D,GlobalMaxPooling2D,MaxPool2D,UpSampling2D,concatenate,Dropout
from PIL import Image
import numpy as np
import tflearn
import imutils
import cv2

class AutoEncoder():
    def __init__(self, model_path, input_shape, optimizer_, learning_rate_, loss_, intermediate_activation_, output_activation_, num_classes_):
        self.model_path = model_path
        self.input_shape = input_shape
        self.optimizer_ = optimizer_
        self.learning_rate_ = learning_rate_
        self.loss_ = loss_
        self.intermediate_activation_ = intermediate_activation_
        self.output_activation_ = output_activation_
        self.num_classes_ = num_classes_
        self.conv_ = None
        self.model_ = None
    
    def layers_setup(self):
        conv_ = input_data(shape=self.input_shape, name='input')
        conv_ = conv_2d(conv_, 32, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = conv_2d(conv_, 64, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = conv_2d(conv_, 128, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = conv_2d(conv_, 256, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = conv_2d(conv_, 256, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = conv_2d(conv_, 128, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = conv_2d(conv_, 64, 2, activation=self.intermediate_activation_)
        conv_ = max_pool_2d(conv_, 2)
        conv_ = fully_connected(conv_, 1000, activation=self.intermediate_activation_)
        conv_ = dropout(conv_, 0.75)
        conv_ = fully_connected(conv_, self.num_classes_, activation=self.output_activation_)

        self.conv_ = conv_
    
    def layers_setup_cnn(self):
        model = Sequential()
        model.add(Conv2D(64, (3, 3), activation='relu', input_shape=(224, 224, 1)))
        model.add(MaxPooling2D(pool_size=(2, 2)))

        model.add(Conv2D(64, (3, 3), activation='relu'))
        model.add(MaxPooling2D(pool_size=(2, 2)))

        model.add(Dropout(0.25))

        model.add(Flatten())

        model.add(Dense(256, activation='relu'))
        model.add(Dropout(0.25))

        model.add(Dense(256, activation='relu'))
        model.add(Dropout(0.25))

        model.add(Dense(10, activation='softmax'))

        model.load_weights(self.model_path)
        self.model_ = model
        return self.model_

    def initialize_weights_(self):

        self.layers_setup()
        conv_ = regression(self.conv_, optimizer=self.optimizer_, learning_rate=self.learning_rate_, loss=self.loss_, name='regression')
        self.model_ = tflearn.DNN(conv_, tensorboard_verbose=0)
        self.model_.load(self.model_path)
        return self.model_

    def initialize_weights_cnn(self):
            
        return self.layers_setup_cnn()

class GestureDetector():
    def __init__(self, image_name, model_, a_weight_, roi_coord_):
        self.image_name = image_name
        self.model_ = model_
        self.a_weight_ = a_weight_
        self.roi_coord_ = roi_coord_
        self.base_width = 224
        self.background = None
        self.threshold = 25
        self.start_recording = False
    
    def resize_image(self):
        img = Image.open(self.image_name)
        wpercent = (self.base_width/float(img.size[0]))
        hsize = int(224)
        img = img.resize((self.base_width,hsize), Image.ANTIALIAS)
        img.save(self.image_name)
    
    def run_avg(self, image, a_weight):
        if self.background is None:
            self.background = image.copy().astype("float")
            return
        cv2.accumulateWeighted(image, self.background, a_weight)
    
    def segment(self, image):
        diff = cv2.absdiff(self.background.astype("uint8"), image)
        thresholded = cv2.threshold(diff, self.threshold, 255, cv2.THRESH_BINARY)[1]
        (cnts, _) = cv2.findContours(thresholded.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        if len(cnts) !=0:
            segmented = max(cnts, key=cv2.contourArea)
            return (thresholded, segmented)

    def calc_confidence_(self, pred_):
        sum_ = 0
        for probab in pred_[0]:
            sum_ += probab
        return np.amax(pred_) / (sum_)

    def predict_(self):
        image = cv2.imread(self.image_name)
        gray_ = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        pred_ = self.model_.predict([gray_.reshape(1, 224,224, 1)])
        return np.argmax(pred_), self.calc_confidence_(pred_)

    def show_stats(self, pred_class_, confidence_):

        txt_image = np.zeros((300, 512, 3), np.uint8)
        class_name = ""

        if pred_class_ == 0:
            class_name = "palm"
        elif pred_class_ == 1:
            class_name = "L"
        elif pred_class_ == 2:
            class_name = "fist"
        elif pred_class_ == 3:
            class_name = "fist_moved"
        elif pred_class_ == 4:
            class_name = "thumb"
        elif pred_class_ == 5:
            class_name = "index"
        elif pred_class_ == 6:
            class_name = "ok"
        elif pred_class_ == 7:
            class_name = "palm_moved"
        elif pred_class_ == 8:
            class_name = "c"
        elif pred_class_ == 9:
            class_name = "down"
        
        cv2.putText(txt_image, "Class: " + class_name, (30, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

        cv2.putText(txt_image, "Confidence: " + str(confidence_), (30, 100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

        cv2.imshow("Stats", txt_image)

    def start_(self):
        camera_ = cv2.VideoCapture(0)

        top, right, bottom, left = self.roi_coord_

        num_frames = 0
        self.start_recording = False

        while(True):
            (grabbed, frame) = camera_.read()

            frame = imutils.resize(frame, width=700)
            frame = cv2.flip(frame, 1)
            clone = frame.copy()

            (height, width) = frame.shape[:2]

            roi = frame[top:bottom, right:left]

            gray = cv2.cvtColor(roi, cv2.COLOR_BGR2GRAY)
            gray = cv2.GaussianBlur(gray, (7, 7), 0)

            if num_frames < 30:
                self.run_avg(gray, self.a_weight_)
            else:
                hand = self.segment(gray)

                if hand is not None:
                    (thresholded, segmented) = hand

                    cv2.drawContours(clone, [segmented + (right, top)], -1, (0, 0, 255))

                    if self.start_recording:
                        cv2.imwrite(self.image_name, thresholded)
                        self.resize_image()
                        pred_class_, confidence_ = self.predict_()
                        self.show_stats(pred_class_, confidence_)
                    cv2.imshow("Thesholded", thresholded)

            cv2.rectangle(clone, (left, top), (right, bottom), (0,255,0), 2)

            num_frames += 1

            cv2.imshow("Video Feed", clone)

            keypress = cv2.waitKey(1) & 0xFF

            if keypress == ord("q"):
                break
            
            if keypress == ord("s"):
                self.start_recording = True

if __name__ == "__main__":
    # AutoEncoder setup
    # model = AutoEncoder("TrainedModel/GestureRecogModel.tfl", [None, 89, 100, 1], "adam", 0.001, "categorical_crossentropy", "relu", "softmax", 3)
    model = AutoEncoder("model/CNN_.tfl", [None, 224, 224, 1], "adam", 0.001, "categorical_crossentropy", "relu", "softmax", 10)

    model = model.initialize_weights_cnn()

    detector_ = GestureDetector("Train.png", model, 0.5, (10, 350, 225, 590))
    detector_.start_()






        



