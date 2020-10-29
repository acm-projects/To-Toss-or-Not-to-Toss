# Keep or Yeet

This project is a Flutter application that implements a TensorFlow Lite model to receive a users image and determine whether it is recyclable or not. Hence, Keep or Yeet.

It is forked from the repository that our ACM Projects team used to develop it on.

## Backend

Using Python, we implemented a TensorFlow/Keras Convolutional Neural Network. We trained it on a Kaggle Dataset of images. The images were preprocessed, sorted for outliers, and augmented to increase the training set size. We managed to reach a Validation score of 92%. 

In Hindsight, after studying Machine Learning in more depth, there's a lot more Data Cleaning and Preprocessing that could've made the model better at classifying the images. We could have also used a cleaner dataset.

The TensorFlow model had to be converted to a TensorFlow Lite model for use on mobile devices.

## Frontend

We used Figma to prototype designs, and we used Flutter to create the Frontend UI of the application. 

## How to Run the Code

The ML Models are IPython notebooks that can be opened in Jupyter or Google Colab. We used Colab for the Hosted GPU's to speed up training. 

The Flutter code can be opened with a Simulator in one's own IDE. 
