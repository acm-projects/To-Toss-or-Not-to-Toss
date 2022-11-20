# Keep or Yeet

This project is a Flutter application that implements a TensorFlow Lite model to receive a users image and determine whether it is recyclable or not. Hence, Keep or Yeet.

It is forked from the repository that our ACM Projects team used to develop it on.

---

## Backend

Using Python, we implemented a TensorFlow/Keras Convolutional Neural Network. We trained it on a Kaggle Dataset of images. The images were preprocessed, sorted for outliers, and augmented to increase the training set size. We managed to reach a Validation score of 92%. 

In Hindsight, after studying Machine Learning in more depth, there's a lot more Data Cleaning and Preprocessing that could've made the model better at classifying the images. We could have also used a cleaner dataset.

The TensorFlow model had to be converted to a TensorFlow Lite model for use on mobile devices.

### Within the Backend Folder

#### FOLDERS

**Folder --> Model Training Files**
* Contains the original python files to train the models in Google Colab (Need to make adjustments if using in your own IDE)
    


**Folder --> Saved Models**
* Can be used to load straight into a script without having to retrain the model
* Includes SavedWeights + SavedModels



**Folder --> Reports**
* Information about accuracy and loss of various combinations of variables being adjusted
* Categorized by the Model being worked on with the respective dataset and base CNN used
* ADJUSTMENTS MADE/BEING MADE
* Optimizers
  * Nadam
  * SGD
* Base Pre-Trained CNN
* InceptionV3
* MobileNet
  * Learning Rate Adjustments (in Changelog)
  * Epoch/batches Adjustments (in Changelog)
  * Image Import Size Adjustments (in Changelog) (128x128 vs 224x224)

#### FILES

**Executable Prediction Script.py**
* This imports the SavedModel, and can make predictions on it
* THIS IS NOT TFLITE, NEED TO CONVERT ONCE THE MODEL IS FINALLY TRAINED

**DataSets.txt**
* This includes all datasets used

**Kaggle.json**
* This is my personal API Key from Kaggle's website (Used in the training script to download datasets)

**ACM App Changelog**
* This is directly exported from my iPad, any changelogs as the model was worked on (Will be updated as time goes)

---

## Frontend

We used Figma to prototype designs, and we used Flutter to create the Frontend UI of the application. 

---

## How to Run the Code

The ML Models are IPython notebooks that can be opened in Jupyter or Google Colab. We used Colab for the Hosted GPU's to speed up training. 

The Flutter code can be opened with a Simulator in one's own IDE. 
