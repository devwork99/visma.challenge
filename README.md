#  VISMA CODE CHALLENGE (Muhammad Yasir)


## DEMO (Screen Shots, video)

### ![alt text](https://github.com/devwork99/visma.challenge/blob/dev/visma.challenge/Demo/demo_screens.PNG)


### ![alt text](https://github.com/devwork99/visma.challenge/blob/dev/visma.challenge/Demo/demo_video720.mov)





## Overview

An iOS demo project that demonstrate the capability to scan a receipty and store in local storage



## CLEAN Architecture (ViewModel --> UseCase --> Repository --> NetworkingLayer)

Using CLEAN architecture for better separation of concerns

Using Protocol Oriented Programming (POP), the view models access the particular USECASE to add the scan to the list.

The USECASE further access the REPOSITORY to add some new item, or fetch a list of items.

The Repository, since the data is local CoreData storage, loads from container and passes back to the usecase.  

Once the data is in the ViewModel is updated, the VIEW gets updated with the Observeable.
 

ViewModels --> UserCase --> Repository --> NetworkingLayer


## Coordinator

For Navigation using the coordinator pattern, to navigate FEATURE based.

## MVVM

MVVM design patterns using Observable and Published patterns

## Core Data

Core data usage to save the scans in the project

## GIT (current branch "dev") 

please use the current branch "dev" to overview the project

## Xcode16.2 , IOS 16.2 Onwards, Swift5

## Unit Tests 

Unit tests are on the way.

## Features

    - Scan a grocerry store receipt i.e LiDL, Auchan, McDonalds
    - With the use of 'VisionKit', extract the data in the receipt and save in Core Data
    - Listing to see the previous scans
    - Git current branch "dev" (others, main)
    - Using MVVM architecture for iOS mobile app, separatin of concerns
    - Using Coordinator pattern for independent Navigation
    - Compatible iOS 16.2 onwards, XCode 16.2, Swift5
    
    
    


