# FinancePeer Task
  This repository was made for Yellow Class's take home task. 
  
# Table of Contents
  - [Overview](#financepeer-task)
  - [Building and Installation](#building-and-installation)
  - [Technical Discussion](#technical-discussion)

  ## Problem Statement 
 Build a basic web application having the following features:
1. An authentication system.
2. Upload a file and save the data in the database.
3. Display the data saved in the database(use styling and themes as required).

  #### Assigned To 
  Aryan Gupta 18BCE10062

  ## Status
  I have completed the task accomplishing the following -
  - I made a django server/api which can handle get and post request and also has an admin panel to access everything at once
  - I made a web app that can authenticate, upload a file, send it to the server and finally, show the contents of the file to the user

  # Building and Installation
  ## Prerequisites
  To build this app, you will need -
  - [Flutter SDK](https://flutter.dev)
  - [Firebase Project](https://firebase.google.com) - you will have to create your own project and add your own **google-services.json** (I have not included it in this repo)
    - [Handy Tutorial to add Firebase into your flutter app](https://firebase.flutter.dev) 
  - Django and Python - for the server/api


  ## Cloning the Project Repo
  If you like using the terminal
   - Navigate to where you want to clone this repo
   - ```git clone https://github.com/aryang117/financepeertest.git```
  <br> </br>
  
  If you wish to clone using the browser only
   - Scroll up to the about section
   - To the left of about section, you will see a button with label ``Code``
   - Click on the code button and then on Download zip
   - Extract the zip and you have the project folder!
    
   [Other ways to get the project repo](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository)
  
  ## Build
  Now, to actually build the app
  - Clone this repo
  - Navigate to the folder where this repo has been cloned
  - ```flutter run -d web-server``` to build and run a debug build of the web app
  
  ## Installation
  To install this on a browser, after building the web app
  - Open your browser and navigate to the address, as mentioned in the console
  - It should be running now now! Check it out! (Assuming no errors occured during build)

  ## Django Server
  To run the django server, navigate to the \notes\ subdirectory of the project and in your console, type
  ``python manage.py runserver``
  
  
  # Technical Discussion
  ## Packages Used
  These are the different 3rd Party Packages I used to complete this project
  - http (^0.13.3) - to implement API calls

  ## Features Implemented
  
  The app already fulfills all the requirements given in the problem statement. 
  
  ### Optional Features Implemented
  The App allows the user to persistently sign in anonymously or sign in via Google or skip the sign in.
  Only signed in users are allowed to add new movies. 
  
  ### Extra Features Implemented
  I added a few features that were not part of the problem statement, but they were added to help in development and are just tiny QoL (Quality of Life) features to make it easier to perform all operations of the app
  #### File Content Page
  Shows the contents of the file that you just uploaded
 
  ### [Back to top](#financepeer-task)
