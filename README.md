# To-Toss-or-Not-to-Toss
Mobile app designed to settle the question, "Is this recyclable?" through image recognition and machine learning.

[Git Cheat Sheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)

### Summary:

Help save the environment and have fun, too! This app scans an object and determines if it is recyclable or not. Alternatively, users can input information about the object manually and answer questions to determine if it should be tossed or not. Users can gain points for every object they recycle and trade them for stickers and other rewards.

### MVP:

A camera page where the user can either take pictures or upload one and the app will determine whether or not it is recyclable. Additionally, there should be a page where users can answer a questionnaire about the object, and the app will decipher whether it meets the requirements to be recycled.

### Stretch Goals:
- Add game-like elements to app such as giving points for inputting a recyclable object
- Points can be exchanged for stickers or different UI elements like backgrounds or color palette changes
- Add login feature 
- Expand database to include different regional standards

### Tech Stack:
- ***Machine learning model***
  - Watson Visual Recognition API
    - [Intro guide to Watson](https://developer.ibm.com/articles/introduction-watson-visual-recognition/)
  - Clarifai
  - Cloud API

- ***Front-End***
  - React Native
  - Flutter
  
- ***Back-End***
  - Python
  - Java

- ***IDE***
  - Visual Studio Code 
  - Android Studio
  
### Suggestions:
- VS Code is a great IDE and it looks a lot nicer than Android Studio xD so _highly_ recommend it
- Flutter is very intuitive and similar to Java. It also has a hot reload feature which is very helpful. Only downside is that it not as compatible with Firebase, for example (you may use Firebase when implementing the login feature).
