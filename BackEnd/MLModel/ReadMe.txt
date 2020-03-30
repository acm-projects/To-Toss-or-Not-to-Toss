Basically this ReadMe is to guide you through the contents of this folder


----------------------------------
FOLDERS
-------
Folder --> Model Training Files
    - Contains the original python files to train the models in Google Colab (Need to make adjustments if using in your own IDE)
    


Folder --> Saved Models
    - Can be used to load straight into a script without having to retrain the model
    - Includes SavedWeights + SavedModels



Folder --> Reports
    - Information about accuracy and loss of various combinations of variables being adjusted
    - Categorized by the Model being worked on with the respective dataset and base CNN used
    - ADJUSTMENTS MADE/BEING MADE
    - Optimizers
        - Nadam
        - SGD
    - Base Pre-Trained CNN
	- InceptionV3
	- MobileNet
    - Learning Rate Adjustments (in Changelog)
    - Epoch/batches Adjustments (in Changelog)
    - Image Import Size Adjustments (in Changelog) (128x128 vs 224x224)


----------------------------------
FILES
-------

Executable Prediction Script.py
    - This imports the SavedModel, and can make predictions on it
    - THIS IS NOT TFLITE, NEED TO CONVERT ONCE THE MODEL IS FINALLY TRAINED

DataSets.txt
    - This includes all datasets used

Kaggle.json
    - This is my personal API Key from Kaggle's website (Used in the training script to download datasets)

ACM App Changelog
    - This is directly exported from my iPad, any changelogs as the model was worked on (Will be updated as time goes)